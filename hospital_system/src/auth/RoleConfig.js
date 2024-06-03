export const RoleConfig = () => {
    const role = localStorage.getItem("role"); // Replace with your actual access token
    console.log("Access Token:", role);

    if(role === "DOCTOR"){
        return "DOCTOR"
    }else if(role === "DATA"){
        return "ADMIN"
    }else if(role === "USER"){
        return "PATIENT"
    }
};