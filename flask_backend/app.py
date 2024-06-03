from flask import Flask, request, jsonify
import numpy as np
from service.image_service import predict_using_own_model , predict_using_yolo_v5 , predict_using_yolo_v8
import cv2
from flask_cors import CORS
import pathlib
from PIL import Image
import os
import torch
import const
from ultralytics import YOLO

APP_NAME = 'alz'
class_names = ['MildDementia', 'ModerateDementia', 'NonDementia', 'VeryMildDementia']

app = Flask(APP_NAME)
CORS(app)


pathlib.PosixPath = pathlib.WindowsPath
print("Current Working Directory:", os.getcwd())
model_yolo_v5 = torch.hub.load('ultralytics/yolov5', 'custom', path='models/best.pt', force_reload=False)
model_yolo_v8 = YOLO('models/best_v8.pt')
print("Available Classes V5 : " , model_yolo_v5.names)
print("Available Classes V8 : " , getattr(model_yolo_v8, 'names', None))

selected_mode = const.YOLO_V8

@app.route('/predict', methods=['POST'])
def predict():
    # Check if an image was uploaded
    if 'image' not in request.files:
        return jsonify({'error': 'No image uploaded'})

    # Load and preprocess the image received from the Flask API
    file = request.files['image']

    if selected_mode == const.SCRATCH:
        image = cv2.imdecode(np.fromstring(file.read(), np.uint8), cv2.IMREAD_COLOR)
        prediction, confidence = predict_using_own_model(image)
        prediction = class_names[prediction]

    elif selected_mode == const.YOLO_V5:
        image = Image.open(file)
        prediction_list = predict_using_yolo_v5(image, confidence_threshold=0.5 , model=model_yolo_v5)
        prediction = prediction_list['class']
        confidence = float(prediction_list['confidence'])

    elif selected_mode == const.YOLO_V8:
        image = Image.open(file)
        prediction_list = predict_using_yolo_v8(image, confidence_threshold=0.5, model=model_yolo_v8 )
        prediction = prediction_list['class']
        confidence = float(prediction_list['confidence'])

    else:
        return jsonify({'error': 'selected model not exists'})





    return jsonify(
        {
            'predicted_class': prediction,
            'confidence': confidence
        }
    )


if APP_NAME == 'alz':
    app.run(debug=False)

