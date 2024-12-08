<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #ffffff;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    perspective: 1000px;
    overflow: hidden;
    margin: 0;
    padding: 0;
}

.container {
    text-align: center;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 4rem 3rem;
    box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.2);
    max-width: 600px;
    width: 90%;
    transform: rotateX(10deg);
    transition: all 0.5s ease;
}

.container:hover {
    transform: rotateX(0deg) scale(1.05);
    box-shadow: 0 35px 55px rgba(0, 0, 0, 0.15);
}

.error-code {
    font-size: 10rem;
    font-weight: 900;
    background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    margin-bottom: 1rem;
    letter-spacing: -10px;
    animation: pulse 2s infinite alternate;
}

@keyframes pulse {
    0% {
        transform: scale(1);
    }
    100% {
        transform: scale(1.05);
    }
}

.error-message {
    font-size: 2.5rem;
    font-weight: 700;
    color: #ffffff;
    text-transform: uppercase;
    letter-spacing: 5px;
    margin-bottom: 1.5rem;
    text-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
}

.error-description {
    font-size: 1.2rem;
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin-bottom: 2.5rem;
    max-width: 500px;
    margin-left: auto;
    margin-right: auto;
}

.home-button {
    display: inline-block;
    padding: 1rem 2.5rem;
    background: linear-gradient(45deg, #4ecdc4, #45b7d1);
    color: white;
    text-decoration: none;
    border-radius: 50px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    transition: all 0.3s ease;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    position: relative;
    overflow: hidden;
}

.home-button::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(120deg, transparent, rgba(255,255,255,0.3), transparent);
    transition: all 0.5s ease;
}

.home-button:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
}

.home-button:hover::before {
    left: 100%;
}

.particles {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    overflow: hidden;
    pointer-events: none;
}

.particle {
    position: absolute;
    width: 6px;
    height: 6px;
    background: rgba(255, 255, 255, 0.5);
    border-radius: 50%;
    box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
    animation: particleFloat 15s linear infinite;
}

@keyframes particleFloat {
    0% {
        transform: translateY(0) translateX(0) rotate(0deg);
        opacity: 0;
    }
    50% {
        opacity: 0.7;
    }
    100% {
        transform: translateY(-100vh) translateX(50vw) rotate(360deg);
        opacity: 0;
    }
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .error-code {
        font-size: 6rem;
        letter-spacing: -5px;
    }

    .error-message {
        font-size: 2rem;
        letter-spacing: 3px;
    }

    .error-description {
        font-size: 1rem;
    }

    .container {
        padding: 2rem 1.5rem;
        width: 95%;
    }
}
    </style>
</head>
<body>
    <div class="particles"></div>

    <div class="container">
        <div class="error-code">404</div>
        <div class="error-message">Page Not Found</div>
        <div class="error-description">
            The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.
        </div>
        <a href="/" class="home-button">Return Home</a>
    </div>

<script>
        function createParticle() {
            const particlesContainer = document.querySelector('.particles');
            const particle = document.createElement('div');
            particle.className = 'particle';
            particle.style.left = Math.random() * 100 + 'vw';
            particle.style.animationDuration = 15 + Math.random() * 15 + 's';
            particle.style.animationDelay = Math.random() * 5 + 's';
            particlesContainer.appendChild(particle);

            setTimeout(() => {
                particle.remove();
            }, 30000); 
        }

        setInterval(createParticle, 500); 
    </script>
</body>
</html>