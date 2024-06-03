import React, { useEffect, useState } from 'react';
import './FlyInTextComponent.css';

const FlyInTextComponent = () => {
    const [isVisible, setIsVisible] = useState(false);

    useEffect(() => {
        setTimeout(() => {
            setIsVisible(true);
        }, 500);
    }, []);

    return (
        <div className={`fly-in-text ${isVisible ? '' : 'hidden'}`} style={{ width: '60%' }}>
            <div className="fly-in-text-li">W</div>
            <div className="fly-in-text-li">E</div>
            <div className="fly-in-text-li">L</div>
            <div className="fly-in-text-li">C</div>
            <div className="fly-in-text-li">O</div>
            <div className="fly-in-text-li">M</div>
            <div className="fly-in-text-li">E</div>
        </div>
    );
};

export default FlyInTextComponent;
