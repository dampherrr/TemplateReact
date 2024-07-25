import React from "react";

import "../App.css";
import "../styles/navbar.scss";
import "../styles/stars.scss";

function Contact() {
  return (
    <>
      <div className="container">
        <h1 className="sayHello">Contact</h1>
        <div className="content">
          <p>- PhoneNumber: </p>
          <p>- Email: </p>
          <p>- Website: </p>
          <p>- Address: </p>
        </div>
      </div>
    </>
  );
}

export default Contact;
