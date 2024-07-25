import React from "react";
import "../styles/stars.scss";
import "../styles/navbar.scss";
import "../app.css";

function Home() {
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
    </>
  );
}

export default Home;
