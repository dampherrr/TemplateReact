import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

import NavBarProvider from "../context/NavBarContext.jsx";
import "../styles/navbar.scss";

import "../styles/searchbar.css";

function NavBar() {
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

  const [showLinks, setShowLinks] = useState(false);
  const handleShowLinks = () => {
    setShowLinks(!showLinks);
  };

  return (
    <NavBarProvider>
      <div className="menu">
        <nav className={`navBar ${showLinks ? "show-nav" : "hide-nav"}`}>
          <button type="button" className="titleNav" onClick={goHome}>
            <img
              className="reactIcon"
              src="./assets/media/pictures/react.gif"
              alt=""
            />{" "}
            Home
          </button>
          <ul className="list">
            <li className="navBarItem slideInDown-1">
              <button type="button " className="navigation" onClick={goAbout}>
                About
              </button>
            </li>
            <li className="navBarItem slideInDown-2">
              <button type="button" className="navigation" onClick={goProject}>
                Projects
              </button>
            </li>
            <li className="navBarItem slideInDown-3">
              <button type="button" className="navigation" onClick={goNews}>
                News
              </button>
            </li>
            <li className="navBarItem slideInDown-4">
              <button type="button" className="navigation" onClick={goContact}>
                Contact
              </button>
            </li>
            <li className="navBarItem"></li>
          </ul>
          <form action="" className="search-bar slideInDown-5">
            <input type="search" className="search" pattern=".*\S.*" required />
            <button className="search-btn" type="submit"></button>
          </form>
          <button className="menubutton" onClick={handleShowLinks}>
            <span className="burger-bar"></span>
          </button>
        </nav>
      </div>
    </NavBarProvider>
  );
}

export default NavBar;
