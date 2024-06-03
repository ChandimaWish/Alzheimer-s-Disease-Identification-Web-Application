import React, {useEffect, useState} from "react";

// react-bootstrap components
import {
    Button,
    Table,
    Container,

} from "react-bootstrap";
import axios from "axios";
import ProtectiveRoute from "../../auth/ProtectiveRoute";
import {AuthConfig} from "../../auth/AuthConfig";
import {BASE_URL} from "../../config/Config";
import DatePicker from "react-datepicker";
import LineGraph from "../LineGraph";
import {RoleConfig} from "../../auth/RoleConfig";
import {NicConfig} from "../../auth/NicConfig";
import CommentDisplay from "../CommentDisplay";

function Alzheimer({closeParent}) {
    ProtectiveRoute()
    const thArray = ["USER ID", "REPORT ID" , "PATENT NAME","NIC","REPORT DATE","FBS","ACTION"];
    const [tdArray , setTdArray] = useState([])


    const[refresh, setRefresh] = useState(false);
    const [patientNic , setPatientNic] = useState("")
    const [patientId , setPatientId] = useState("")
    const [file, setFile] = useState(null);
    const [preview, setPreview] = useState(null);
    const [reportedDate, setReportedDate] = useState('');
    const [comment, setComment] = useState("");
    const [disabled, setDisabled] = useState(false);
    const [labels , setLabels] = useState([]);
    const [data,setData] = useState([]);
    const [prediction,setPrediction] = useState("");
    const [comments, setComments] = useState([])
    const [selectedReport , setSelectedReport] = useState(null)
    const [base64Image, setBase64Image] = useState("")
    const [isPredictLoad, setIsPredictLoad] = useState(true)
    const [isStartLoading, setStartLoading] = useState(false)


    const[patientName , setPatientName] = useState("");
    const[email , setEmail] = useState("");
    const[nic , setNic] = useState("");

    const [isPatient, setIsPatient] = useState(true)

    useEffect(()=>{
        if(RoleConfig() == "PATIENT"){
            setIsPatient(true)
            setPatientNic(NicConfig())
        }else {
            setIsPatient(false)
        }
    },[])

    useEffect(() => {
        if (file) {
            handlePredictions();
        }
    }, [file]);


    const handleDateChange = (date) => {
        // Zero out the time components
        const newDate = new Date(date);
        newDate.setHours(0, 0, 0, 0);

        setReportedDate(newDate.toISOString().slice(0, 10));
    };

    const handlepatientNic = (event) => {
        setPatientNic(event.target.value);
    };

    const handleComment = (event) => {
        setComment(event.target.value);
    };

    const handleDisable = () =>{
        setComment("")
        setFile(null)
        setPreview(null)
        setReportedDate("")
        setDisabled(false)
        setPrediction("")
    }

    const handlePredictions = () =>{
        setIsPredictLoad(true)
        setStartLoading(true)
        setPrediction("")
        const formData = new FormData();
        formData.append('image', file);

        axios.post('http://127.0.0.1:5000/predict', formData)
            .then((response) => {
                console.log('Prediction Result:', response.data);
                setPrediction(response.data.predicted_class)
                setIsPredictLoad(false)
                setStartLoading(false)
            })
            .catch((error) => {
                console.error('Error during prediction:', error);
            });

    }

    const handleFileChange = (e) => {
        const selectedFile = e.target.files[0];

        // Preview the selected file (for image or PDF)
        if (selectedFile && (selectedFile.type.startsWith('image/') || selectedFile.type === 'application/pdf')) {
            const reader = new FileReader();

            reader.onloadend = () => {
                setPreview(reader.result);
            };

            reader.readAsDataURL(selectedFile);

        } else {
            // Clear preview if the selected file is not an image or PDF
            setPreview(null);
        }

        setFile(selectedFile);
    };

    const loadReportData = () => {
        axios.get(`${BASE_URL}/api/v2/reports/findAllBy?nic=${patientNic}`, AuthConfig())
            .then((res) => {
                setLabels(res.data.labels)
                setData(res.data.data)
            })
            .catch((e) => {
                if(e.response) {
                    console.log(e.response.data.message);
                    alert(e.response.data.message)
                }
            });
    }


    const handleSearch = (event) => {
        axios.get(`${BASE_URL}/api/v2/reports/findAllBy?nic=${patientNic}`, AuthConfig())
            .then((res) => {
                const tempArray = res.data.map((row) => [
                    row.patient.id,
                    row.id,
                    row.patient.user.firstName,
                    row.patient.nic,
                    row.reportedDate,
                    row.fbs,
                    <div>
                        <button type="button" className="btn btn-success mr-3" onClick={()=>handleView(row.id)}>
                            <i className="fa-regular fa-eye"></i></button>
                        <button type="button" className="btn btn-danger" disabled={isPatient} onClick={()=>handleDeleteFbs(row.id)}>
                            <i className="fa-regular fa-trash-can"></i></button>
                    </div>
                ]);
                setTdArray(tempArray);

                setPatientId(tempArray[0][0])

                res.data.map((row)=>{
                    setPatientName(row.patient.user.firstName)
                    setEmail(row.patient.user.email)
                    setNic(row.patient.nic)
                })

                loadReportData()
                setRefresh(true)
            })
            .catch((error) => {
                // Handle any errors here
                console.error("Error fetching data:", error);
            });

        if(!isPatient){
            setPatientNic("")
        }


    };

    const handleDataSave = (event) =>{
        event.preventDefault()
        const formData = new FormData();
        formData.append('prediction', prediction);
        formData.append('patientId', patientId);
        formData.append('reportedDate', reportedDate);
        formData.append('report', file);
        formData.append('comment', comment);

        axios.post(`${BASE_URL}/api/v2/reports/addReport`, formData, AuthConfig())
            .then((res) => {
                alert("Report was successfully added")
                setRefresh(false)
                // window.location.reload();
                closeParent()
            })
            .catch((e) => {
                if(e.response) {
                    console.log(e.response.data.message);
                    alert(e.response.data.message)
                }
            });

    }

    const handleView = (id) => {
        setDisabled(true)
        document.getElementById("viewarea").click();

        setSelectedReport(id)

        axios.get(`${BASE_URL}/api/v2/reports/report?id=${id}`, AuthConfig())
            .then((res) => {
                setComment(res.data.fbs)
                setReportedDate(res.data.reportedDate)
                setFile(res.data.fileDir)
                setPreview(res.data.fileDir)
                setComments(res.data.comments)
                setPrediction(res.data.prediction)
                setBase64Image(res.data.base64Image)
            })
            .catch((e) => {
                if(e.response) {
                    console.log(e.response.data.message);
                    alert(e.response.data.message)
                }
            });

    }

    const handleDeleteFbs = (id) =>{
        axios.post(`${BASE_URL}/api/v2/reports/removeFbs?fbsId=${id}`,{}, AuthConfig())
            .then((res) => {
                alert("Selected item was removed")
                closeParent()
            })
            .catch((e) => {
                if(e.response) {
                    console.log(e.response.data.message);
                    alert(e.response.data.message)
                }
            });
    }

    const handleComments = (event) =>{
        event.preventDefault()

        const commentData = {
            'dataId' : selectedReport,
            'comment' : comment
        }

        console.log(commentData)

        axios.post(`${BASE_URL}/api/v2/reports/addNewComment` , commentData , AuthConfig())
            .then((res) => {
                alert("Comment was added")
                setComment('')
                handleView(selectedReport)
            })
            .catch((e)=>{
                console.log(e.response.data.message);
                alert(e.response.data.message)
            })

    }

    const resetDataForm = () =>{
        setPreview(null);
        setComment("");
        setReportedDate('');
        setPrediction('')
        setIsPredictLoad(true)
        setComments([])
        setDisabled(false)
    }

    const getToday = () => {
        const today = new Date();
        return new Date(today.getFullYear(), today.getMonth(), today.getDate());
    };



    return (
        <>
            <Container fluid>

                <div>
                    <div className="form-group">
                        <div className="row">
                            <div className="col-4"><label htmlFor="patientNic">Patient nic</label></div>
                            <div className="col-5">                        <input
                                type="text"
                                className="form-control form-control-sm"
                                id="patientNic"
                                disabled={isPatient}
                                required
                                value={patientNic}
                                onChange={handlepatientNic}
                            /></div>
                            <div className="col-3">
                                <button type="button" className="btn btn-secondary" onClick={handleSearch}><i
                                    className="fa-solid fa-magnifying-glass"></i> Search</button></div>
                        </div>


                    </div>
                </div>

                {refresh && (
                    <div>

                        <div>
                            <span>Patient Name : <strong>{patientName}</strong> </span> <br/>
                            <span>Patient Email : <strong>{email}</strong> </span> <br/>
                            <span>Patient NIC : <strong>{nic}</strong> </span> <br/>
                            <hr/>
                            <hr/>
                        </div>


                        <div className="accordion" id="accordionExample">


                                <button className="btn btn-light btn-block text-left collapsed" type="button"
                                        data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false"
                                        aria-controls="collapseTwo">
                                    HISTORY TABLE VIEW
                                </button>

                                <div id="collapseTwo" className="collapse" aria-labelledby="headingTwo"
                                     data-parent="#accordionExample">

                                    <div>
                                        <Table striped hover>
                                            <thead>
                                            <tr>
                                                {thArray.map((prop, key) => (
                                                    <th key={key}>{prop}</th>
                                                ))}
                                            </tr>
                                            </thead>
                                            <tbody>
                                            {tdArray.map((prop, key) => (
                                                <tr key={key}>
                                                    {prop.map((prop, key) => (
                                                        <td key={key}>{prop}</td>
                                                    ))}
                                                </tr>
                                            ))}
                                            </tbody>
                                        </Table>
                                    </div>

                                </div>


                                <br/>


                                <button className="btn btn-light btn-block text-left collapsed" type="button" id = "viewarea"
                                        data-toggle="collapse" data-target="#collapseThree"
                                        aria-expanded="false" aria-controls="collapseThree">
                                    DATA FORM
                                </button>

                                <div id="collapseThree" className="collapse" aria-labelledby="headingThree"
                                     data-parent="#accordionExample">
                                    <div>
                                        <div>
                                            <div className="card mt-2" style={{ border: '1px solid rgba(135, 206, 250, 1)' }}>
                                                <div className="card-body">
                                                    <form onSubmit={handleDataSave} >

                                                        <div className="row">

                                                            <div className="col-6">
                                                                <div className="form-group">
                                                                    <label htmlFor="comment">Comment </label>
                                                                    <textarea
                                                                        required
                                                                        onChange={handleComment}
                                                                        value={comment}
                                                                        className="form-control"
                                                                        id="examplefbs"
                                                                        placeholder="enter comment"
                                                                    />

                                                                    {disabled &&
                                                                    <button type="button"
                                                                            className="btn btn-sm btn-info mt-3" onClick={handleComments}>Comment <i
                                                                        className="fa-solid fa-comments"></i>
                                                                    </button>
                                                                    }
                                                                </div>


                                                                {disabled && <CommentDisplay comments={comments}></CommentDisplay>}


                                                                <div className="form-group">
                                                                    <label htmlFor="file">Upload File <span className={`text-danger`}>*</span></label>
                                                                    <input
                                                                        type="file"
                                                                        required
                                                                        className="form-control-file"
                                                                        disabled={disabled}
                                                                        id="file"
                                                                        accept="image/*"
                                                                        onChange={handleFileChange}
                                                                    />
                                                                </div>

                                                                <div className="form-group row">
                                                                    <label htmlFor="dob" className="col-sm-3 col-form-label">Reported date <span className={`text-danger`}>*</span></label>
                                                                    <div className="col-sm-7">
                                                                        <DatePicker
                                                                            selected={reportedDate}
                                                                            onChange={(date) => handleDateChange(date)}
                                                                            dateFormat="yyyy-MM-dd"
                                                                            maxDate={getToday()}
                                                                            disabled={disabled}
                                                                            className="form-control"
                                                                            placeholderText="Reported date"
                                                                            required
                                                                            isRequired
                                                                        />
                                                                    </div>
                                                                </div>

                                                                <div className="form-group">
                                                                    <label htmlFor="comment">Prediction</label>
                                                                    <input
                                                                        disabled
                                                                        required
                                                                        value={prediction}
                                                                        className="form-control"
                                                                        id="examplefbs"
                                                                    />
                                                                </div>

                                                                <button type="reset"
                                                                        className="btn btn-secondary mr-2" disabled={isPatient} onClick={resetDataForm}>RESET <i
                                                                    className="fa-solid fa-rotate-right"></i>
                                                                </button>
                                                                {disabled && (<>
                                                                    <button type="button" disabled={isPatient} onClick={handleDisable}
                                                                            className="btn btn-warning" >ADD NEW <i
                                                                        className="fa-solid fa-plus"></i>
                                                                    </button>
                                                                </>)}

                                                                {!disabled && (<>
                                                                    <button type="submit" disabled={isPatient || isPredictLoad}
                                                                            className="btn btn-success" >SAVE <i
                                                                        className="fa-solid fa-floppy-disk"></i>
                                                                    </button>
                                                                </>)}


                                                            </div>

                                                            <div className="col-6">

                                                                {!isPredictLoad &&
                                                                <>
                                                                    {preview && !disabled && (
                                                                        <div className="preview-container" style={{
                                                                            maxWidth: '100%',
                                                                            maxHeight: '400px',
                                                                            overflow: 'auto'
                                                                        }}>
                                                                            <p>Preview:</p>
                                                                            {file.type.startsWith('image/') ? (
                                                                                <img src={preview} alt="Preview"
                                                                                     className="preview-image" style={{
                                                                                    width: '300px',
                                                                                    height: '300px'
                                                                                }}/>
                                                                            ) : (
                                                                                <embed src={preview} type={file.type}
                                                                                       width="100%" height="300px"/>
                                                                            )}

                                                                        </div>
                                                                    )}

                                                                    {preview && disabled && (
                                                                        <div className="preview-container" style={{
                                                                            maxWidth: '100%',
                                                                            maxHeight: '400px',
                                                                            overflow: 'auto'
                                                                        }}>
                                                                            <div>
                                                                                <p>File:</p>
                                                                                <img
                                                                                    src={`data:image/jpeg;base64,${base64Image}`}
                                                                                    alt="report"
                                                                                    style={{
                                                                                        maxWidth: '100%',
                                                                                        maxHeight: '100%',
                                                                                        width: '300px',
                                                                                        height: '300px'
                                                                                    }}
                                                                                />
                                                                            </div>
                                                                        </div>
                                                                    )}

                                                                </>
                                                                }

                                                                {isPredictLoad &&
                                                                <>
                                                                    {isStartLoading &&
                                                                    <div>
                                                                        <div className="spinner-grow text-primary"
                                                                             role="status">
                                                                        </div>
                                                                    </div>}
                                                                </>}




                                                            </div>
                                                        </div>


                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>




                    </div>
                )}


            </Container>



        </>
    );
}

export default Alzheimer;
