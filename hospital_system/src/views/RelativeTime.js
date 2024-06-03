import React, { useState, useEffect } from 'react';
import { formatDistanceToNow } from 'date-fns';

const RelativeTime = ({ date }) => {
    const [relativeTime, setRelativeTime] = useState(formatDistanceToNow(new Date(date)));

    useEffect(() => {
        const interval = setInterval(() => {
            setRelativeTime(formatDistanceToNow(new Date(date)));
        }, 1000); // Update every second

        return () => clearInterval(interval);
    }, [date]);

    return <span>{relativeTime}</span>;
};

export default RelativeTime;
