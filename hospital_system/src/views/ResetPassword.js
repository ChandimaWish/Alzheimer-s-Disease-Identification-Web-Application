import React, { useState } from 'react';
import axios from "axios";
import { BASE_URL } from "../config/Config";
import { useNavigate } from "react-router-dom";

export function ResetPassword() {

    const navigate = useNavigate();

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [retypePassword, setRetypePassword] = useState('');
    const [passwordMatch, setPasswordMatch] = useState(true);
    const [passwordResetLink, setPasswordResetLink] = useState("");

    const handleSubmit = (e) => {
        e.preventDefault();
        if (password !== retypePassword) {
            setPasswordMatch(false);
            return;
        }

        const dataToReset = {
            email: email,
        }

        axios.post(`${BASE_URL}/api/v1/auth/password-reset-get-url`, dataToReset)
            .then((res) => {
                setPasswordResetLink(res.data.url);
                handleReset(res.data.url); // Pass the URL to handleReset
            })
            .catch((e) => {
                alert("Request failed");
            });

        setPasswordMatch(true);
    };

    const handleReset = (resetLink) => { // Receive resetLink as a parameter
        if (resetLink == null) {
            return;
        }

        const data = {
            password: password,
            retypePassword: retypePassword
        }

        axios.post(`${resetLink}`, data)
            .then((res) => {
                alert("Password reset success");
                navigate("/login");
            })
            .catch((e) => {
                alert("Request failed 2");
            });
    }

    return (
        <div style={{ maxWidth: '400px', margin: '0 auto', marginTop: '50px' }}>
            <form onSubmit={handleSubmit}>
                <h2 style={{ textAlign: 'center', marginBottom: '20px' }}>Reset Password</h2>
                <div className="form-group">
                    <label htmlFor="email">Email address</label>
                    <input type="email" className="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" value={email} onChange={(e) => setEmail(e.target.value)} />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Password</label>
                    <input type="password" className="form-control" id="password" placeholder="Password" value={password} onChange={(e) => setPassword(e.target.value)} />
                </div>
                <div className="form-group">
                    <label htmlFor="retypePassword">Retype Password</label>
                    <input type="password" className="form-control" id="retypePassword" placeholder="Retype Password" value={retypePassword} onChange={(e) => setRetypePassword(e.target.value)} />
                    {!passwordMatch && <small className="text-danger">Passwords do not match</small>}
                </div>
                <button type="submit" className="btn btn-primary btn-block">Reset Password</button>
            </form>
        </div>
    );
}
