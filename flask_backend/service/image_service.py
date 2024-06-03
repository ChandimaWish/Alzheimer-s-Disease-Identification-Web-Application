
import cv2
import tensorflow as tf
import numpy as np
import torch
from torchvision import transforms

IMAGE_SIZE_V5 = 416

def preprocess_image_own(image , h ,w):
    image = cv2.resize(image, (h, w))
    img_array = image.reshape((1, h, w, 3))
    img_array = img_array / 255.0  # Normalize pixel values (assuming values range from 0 to 255)

    return img_array


def predict_using_own_model(image):
    pre_processed_image = preprocess_image_own(image ,224 ,224)

    # Load the h5 model file
    model = tf.keras.models.load_model('models/best_model.h5')

    # Perform prediction using the preprocessed image
    predictions = model.predict(pre_processed_image)

    # Extract the predicted class
    predicted_class_index = np.argmax(predictions)

    confidence_score = predictions[0][predicted_class_index]

    return int(predicted_class_index), float(confidence_score)




def preprocess_image(img_pil , IMAGE_SIZE):
  transform = None
  transform = transforms.Compose([
      transforms.Resize((IMAGE_SIZE, IMAGE_SIZE)),
      transforms.ToTensor(),
  ])

  img = transform(img_pil)
  img = img.unsqueeze(0)

  return img


def predict_using_yolo_v5(img , confidence_threshold , model):

  img  = preprocess_image(img , IMAGE_SIZE_V5)
  results = model(img)

  bounding_boxes = results[0][:, :4].tolist()
  class_probabilities = results[0][:, 5:].cpu().numpy()

  max_confidence_indices = np.argmax(class_probabilities, axis=1)

  max_confidences = [class_probabilities[i, idx] for i, idx in enumerate(max_confidence_indices)]

  class_names = [model.names[i] for i in max_confidence_indices]

  predictions = [{'class': class_names[i], 'confidence': max_confidences[i], 'bounding_box': bounding_boxes[i]} for i in
                 range(len(bounding_boxes))]

  highest_confidence_prediction = max(predictions, key=lambda x: x['confidence'])

  print(highest_confidence_prediction)

  return highest_confidence_prediction


def predict_using_yolo_v8(img, confidence_threshold, model):
    img = preprocess_image(img, IMAGE_SIZE_V5)
    results = model.predict(img, stream=True)

    highest_confidence = 0
    highest_confidence_box = None

    class_name = ""

    # Iterate over the results
    for result in results:
        boxes = result.boxes.cpu().numpy()
        for box in boxes:
            confidence = float(box.conf)
            if confidence > highest_confidence:
                highest_confidence = confidence
                highest_confidence_box = box

    if highest_confidence_box is not None:
        class_id = int(highest_confidence_box.cls[0])  #
        class_name = model.names[class_id]

    return {
        "class" : class_name,
        "confidence" : highest_confidence
    }







