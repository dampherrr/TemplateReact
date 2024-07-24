import React from "react";
import { useNavigate } from "react-router-dom";

import "../App.css";
import "../styles/navbar.scss";
import "../styles/stars.scss";

function Contact() {
  const navigate = useNavigate();

  const goHome = () => {
    navigate("/");
  };
  const goAbout = () => {
    navigate("/About");
  };
  const goProject = () => {
    navigate("/Projects");
  };
  const goNews = () => {
    navigate("/News");
  };

  const goContact = () => {
    navigate("/Contact");
  };
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
      <div className="menu">
        <nav className="navBar">
          <button type="button" className="titleNav" onClick={goHome}>
            <img
              className="reactIcon"
              src="./assets/media/pictures/react.gif"
              alt=""
            />{" "}
            Template
          </button>
          <ul className={`list ${isMenuOpen ? "open" : ""}`}>
            <li>
              <button type="button" className="navigation" onClick={goAbout}>
                About
              </button>
            </li>
            <li>
              <button type="button" className="navigation" onClick={goProject}>
                Projects
              </button>
            </li>
            <li>
              <button type="button" className="navigation" onClick={goNews}>
                News
              </button>
            </li>
            <li>
              <button type="button" className="navigation" onClick={goContact}>
                Contact
              </button>
            </li>
            <button className="search">Search</button>
          </ul>
          <button className="menubutton" onClick={toggleMenu}>
            Menu
          </button>
        </nav>
      </div>
    </>
  );
}

export default Contact;
