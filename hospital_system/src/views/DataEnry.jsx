import React, {useEffect, useState} from "react";

// react-bootstrap components
import {

    Container,

} from "react-bootstrap";

import ProtectiveRoute from "../auth/ProtectiveRoute";
import Alzheimer from "./reports/Alzheimer";


function DataEnry() {
    ProtectiveRoute()

    const [filter , setFilter] = useState(null)

    const handleFilter = (filter) => {
        setFilter(filter)
    }

    const closeParent = () =>{
        document.getElementById("closeButton").click()
    }

    return (
        <>
            <Container fluid>
                <div className="row row-cols-3">

                    <div className="col mb-3">
                        <button type="button" data-target="#exampleModal" onClick={()=>handleFilter("alz")} data-toggle="modal" className="btn btn-dark" style={{minWidth:"250px"}}>Alzheimer's disease</button>
                    </div>

                </div>
            </Container>





            <div class="modal fade"  id="exampleModal" tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" style={{maxWidth:"80%"}}>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Data Entry Form</h5>
                            <button type="button" class="close" onClick={()=>setFilter(null)} data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            {filter === "alz" && <Alzheimer closeParent={closeParent}/>}

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" id="closeButton" onClick={()=>setFilter(null)} data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </>
    );
}

export default DataEnry;
