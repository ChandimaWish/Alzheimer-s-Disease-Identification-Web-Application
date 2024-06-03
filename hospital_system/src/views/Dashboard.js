import React, {useEffect, useState} from "react";

// react-bootstrap components
import {
    Badge,
    Button,
    Card,
    Navbar,
    Nav,
    Table,
    Container,
    Row,
    Col,
    Form,
    OverlayTrigger,
    Tooltip, Spinner,
} from "react-bootstrap";
import ProtectiveRoute from "../auth/ProtectiveRoute";
import axios from "axios";
import {AuthConfig} from "../auth/AuthConfig";
import {BASE_URL} from "../config/Config";
import FlyInTextComponent from "./FlyInTextComponent";

function Dashboard() {
    ProtectiveRoute()

    const [dashboardData, setDashboardData] = useState();
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        if(isLoading) {
            axios.get(`${BASE_URL}/garden/dashboard/dashboard_view` , AuthConfig())
                .then((res) => {
                    setDashboardData(res.data)
                    setIsLoading(false)
                }).catch((e) => {
                console.log(e)
            })
        }
    }, [])

    if(isLoading){
        return (
            // <>
            //     <Spinner animation="border" variant="primary" />
            //     <Spinner animation="border" variant="secondary" />
            //     <Spinner animation="border" variant="success" />
            //     <Spinner animation="border" variant="danger" />
            // </>
            <FlyInTextComponent></FlyInTextComponent>
        )
    }

    return (
        <>
            <Container fluid>
                <div>
                    <Row>
                        <Col>
                            <Card>
                                <Card.Body>
                                    <h3 style={{textAlign: "center"}}>NO OF PLANTS</h3>
                                    <div style={{textAlign: "center", fontSize: "2rem"}}>{dashboardData.number_of_plants}</div>
                                </Card.Body>
                            </Card>
                        </Col>
                        <Col>
                            <Card>
                                <Card.Body>
                                    <h3 style={{textAlign: "center"}}>NO OF CATEGORIES</h3>
                                    <div style={{textAlign: "center", fontSize: "2rem"}}>{dashboardData.number_of_categories}</div>
                                </Card.Body>
                            </Card>

                        </Col>
                        <Col>
                            <Card>
                                <Card.Body>
                                    <h3 style={{textAlign: "center"}}>NO OF AREAS</h3>
                                    <div style={{textAlign: "center", fontSize: "2rem"}}>{dashboardData.number_of_areas}</div>
                                </Card.Body>
                            </Card>
                        </Col>
                        <Col>
                            <Card>
                                <Card.Body>
                                    <h3 style={{textAlign: "center"}}>NO OF USERS</h3>
                                    <div style={{textAlign: "center", fontSize: "2rem"}}>{dashboardData.number_of_user}</div>
                                </Card.Body>
                            </Card>
                        </Col>
                    </Row>
                </div>
            </Container>
        </>
    );
}

export default Dashboard;
