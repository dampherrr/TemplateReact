import React from "react";
import "../styles/Stars.scss";

const Stars = () => {
  const starElements = Array.from({ length: 50 }).map((_, index) => (
    <div key={index} className="star"></div>
  ));

  return <div className="stars">{starElements}</div>;
};

export default Stars;
