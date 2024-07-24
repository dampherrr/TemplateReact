import { useNavigate } from "react-router-dom";

import "./App.css";
import "./styles/navbar.scss";
import "./styles/stars.scss";

function App() {
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
        <h1 className="sayHello">Bonjour, vous êtes sur la page d'accueil.</h1>
        <div className="content">
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta,
            eveniet! Quam, tempora optio. Eveniet, consequuntur harum quas
            voluptatum ea, eum dolore fugiat et veritatis sed assumenda velit
            eius? Odio, sint!
          </p>
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
          <ul className="list">
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
          </ul>
          <button className="search">Search</button>
          <button className="menubutton">Menu</button>
        </nav>
      </div>
    </>
  );
}

export default App;
