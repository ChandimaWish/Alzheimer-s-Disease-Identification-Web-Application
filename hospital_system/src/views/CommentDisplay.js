import React from 'react';
import RelativeTime from "./RelativeTime";

const CommentDisplay = ({comments}) => {

    return (
        <div className="container mt-4">
            <h5>Comment Display</h5>
            {comments.map(comment => (
                <div key={comment.id} className="card mt-3">
                    <div className="card-body" >
                        <span className="card-text" style={{fontSize:".7rem"}}><i className="fa-solid fa-user"></i> : {comment.createdBy}</span>
                        <br/>
                        <span className="card-text" style={{fontSize:".7rem"}}><i className="fa-regular fa-clock"></i> :  <RelativeTime date={comment.createdAt} /></span>

                        <p className="card-text" style={{color:"#333333"}}>
                            {comment.comment}
                        </p>

                    </div>
                </div>
            ))}
        </div>
    );
};

export default CommentDisplay;
