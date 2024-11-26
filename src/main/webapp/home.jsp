<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        :root {
    /* Expanded Color Palette */
    --primary-color: #4a90e2;      /* Blue */
    --secondary-color: #191919;    /* Soft Red */
    --accent-color: #4ecdc4;       /* Teal */
    --background-light: #f4f4f4;   /* Light Gray */
    --text-color: #333333;
    --gradient-primary: linear-gradient(135deg, #1d1e23, #1d1e23);
    --gradient-secondary: linear-gradient(135deg, #3185fc, #3185fc);
}

body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    background-color: var(--background-light);
    color: var(--text-color);
}

.hero {
    background: var(--gradient-primary);
    position: relative;
    overflow: hidden;
    color: white;
}

.hero::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle at top right, rgba(255,255,255,0.2), transparent 50%);
}

/* Colorful Feature Cards */
.feature-card {
    background: white;
    border: none;
    transition: all 0.4s ease;
    transform: translateY(0);
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

.feature-card:hover {
    transform: translateY(-15px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.15);
}

.feature-icon {
    transition: all 0.4s ease;
    color: var(--primary-color);
}

.feature-card:hover .feature-icon {
    transform: rotate(360deg) scale(1.2);
    color: var(--secondary-color);
}

/* Colorful Buttons */
.btn-custom {
    background: var(--gradient-secondary);
    color: white;
    border: none;
    transition: all 0.3s ease;
    box-shadow: 0 5px 15px rgba(254, 202, 87, 0.4);
}

.btn-custom:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(254, 202, 87, 0.6);
    color: white;
}

/* Carousel Enhancements */
.carousel-indicators [data-bs-target] {
    background-color: var(--primary-color);
    opacity: 0.5;
}

.carousel-indicators .active {
    background-color: var(--secondary-color);
    opacity: 1;
}

.carousel-caption {
    background: rgba(74, 144, 226, 0.7);
    border-radius: 10px;
    padding: 15px;
}

/* Navbar Styling */
.navbar {
    background: var(--gradient-primary) !important;
}

.navbar-brand {
    color: white;
    transition: transform 0.3s ease;
}

.navbar-brand:hover {
    transform: scale(1.05);
}

/* Logo Animation */
@keyframes colorPulse {
    0%, 100% { 
        filter: brightness(1);
    }
    50% { 
        filter: brightness(1.2);
    }
}

.navbar-brand img {
    animation: colorPulse 3s ease-in-out infinite;
    border-radius: 50%;
}

/* Responsive Typography */
@media (max-width: 768px) {
    .display-4 {
        font-size: 2.5rem;
    }

    .display-6 {
        font-size: 1.75rem;
    }
}

/* Section Backgrounds */
.bg-light {
    background: linear-gradient(135deg, 
        rgba(74, 144, 226, 0.1), 
        rgba(78, 205, 196, 0.1)
    ) !important;
}

/* Floating Animation */
@keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-25px); }
}

.floating-element {
    animation: float 4s ease-in-out infinite;
    color: var(--secondary-color);
}

/* Smooth Scroll */
html {
    scroll-behavior: smooth;
}

/* Additional Hover Effects */
.nav-link {
    position: relative;
    color: white;
    transition: color 0.3s ease;
}

.nav-link::after {
    content: '';
    position: absolute;
    width: 0;
    height: 2px;
    bottom: -5px;
    left: 50%;
    background-color: var(--secondary-color);
    transition: all 0.3s ease;
    transform: translateX(-50%);
}

.nav-link:hover::after {
    width: 100%;
}

    .carousel-indicators .active {
        background-color: #2c3e50;
    }



        .btn-custom {
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(0,0,0,0.2);
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .floating-element {
            animation: float 4s ease-in-out infinite;
        }
        /* Logo Styling */
.navbar-brand {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    font-size: 1.5rem;
    font-weight: 700;
    color: #ffffff;
    transition: all 0.3s ease;
}

.navbar-brand img {
    height: 40px;  /* Fixed height for consistent logo size */
    width: 40px;   /* Fixed width to maintain aspect ratio */
    object-fit: contain;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.navbar-brand:hover img {
    transform: scale(1.1) rotate(5deg);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
}

.navbar-brand:hover {
    color: var(--bs-primary);
    text-decoration: none;
}

/* Responsive Logo Adjustments */
@media (max-width: 576px) {
    .navbar-brand {
        font-size: 1.25rem;
    }

    .navbar-brand img {
        height: 30px;
        width: 30px;
    }
}

/* Dark Mode Logo Enhancements */
@media (prefers-color-scheme: dark) {
    .navbar-brand {
        color: #f0f0f0;
    }

    .navbar-brand img {
        filter: brightness(0.9) contrast(1.2);
    }
}

/* Logo Animation */
@keyframes logoGlow {
    0%, 100% { 
        box-shadow: 0 4px 6px rgba(74, 144, 226, 0.2);
    }
    50% { 
        box-shadow: 0 6px 10px rgba(74, 144, 226, 0.4);
    }
}

.navbar-brand img.logo-animated {
    animation: logoGlow 3s ease-in-out infinite;
}

/* High Contrast and Accessibility */
.navbar-brand img.high-contrast {
    filter: contrast(1.2) brightness(1.1);
}

/* Print Optimization */
@media print {
    .navbar-brand img {
        filter: grayscale(100%);
    }
}
    </style>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3">
        <div class="container">
            <a class="navbar-brand fw-bold" href="login">
   				 <img src="/images/university-icon.png" class="logo-animated" />SHS University
				</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container py-5">
        <div class="row align-items-center">
            <div class="col-md-7">
                <h1 class="display-4 fw-bold mb-4">Transform Education with SHS University</h1>
                <p class="lead mb-4">
                    Comprehensive ERP solution designed to streamline academic management, 
                    enhance student experiences, and drive institutional excellence.
                </p>
                <div class="d-flex gap-3">
                    <a href="/login" class="btn btn-light btn-lg rounded-pill px-4 btn-custom" >
                        Get Started
                    </a>
                    <a href="/login" class="btn btn-light btn-lg rounded-pill px-4 btn-custom">
                        Learn More
                    </a>
                </div>
            </div>
            <div class="col-md-5 text-center floating-element">
                <i class="fas fa-graduation-cap display-1"></i>
            </div>
        </div>
    </div>

    <section class="py-5 bg-light">
        <div class="container py-4">
            <div class="text-center mb-5">
                <h2 class="display-6 fw-bold">Our Powerful Features</h2>
                <p class="lead text-muted">Comprehensive tools for modern educational management</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm feature-card h-100">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-users feature-icon display-4 mb-3"></i>
                            <h3 class="h4 mb-3">Student Management</h3>
                            <p class="text-muted">
                                Advanced student tracking, performance analytics, and personalized learning insights.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm feature-card h-100">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-chart-line feature-icon display-4 mb-3"></i>
                            <h3 class="h4 mb-3">Analytics Dashboard</h3>
                            <p class="text-muted">
                                Real-time institutional performance metrics and comprehensive student achievement tracking.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm feature-card h-100">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-calendar-alt feature-icon display-4 mb-3"></i>
                            <h3 class="h4 mb-3">Schedule Management</h3>
                            <p class="text-muted">
                                Intelligent timetable planning and comprehensive resource allocation system.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Carousel Section -->
    <section class="py-5">
        <div class="container">
            <div id="featuresCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#featuresCarousel" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#featuresCarousel" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#featuresCarousel" data-bs-slide-to="2"></button>
                </div>
                <div class="carousel-inner rounded-4 position-relative">
                    <div class="carousel-overlay"></div>
                    <div class="carousel-item active">
                        <img src="/images/image1.jpg" class="d-block w-100" alt="Student Management">
                        <div class="carousel-caption">
                            <h3 class="display-6 fw-bold">Student Management</h3>
                            <p>Comprehensive tracking of student progress and performance</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="/images/image2.jpg" class="d-block w-100" alt="Financial Management">
                        <div class="carousel-caption">
                            <h3 class="display-6 fw-bold">Financial Management</h3>
                            <p>Efficient fee collection and financial reporting</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="/images/image3.jpg" class="d-block w-100" alt="Library Management">
                        <div class="carousel-caption">
                            <h3 class="display-6 fw-bold">Library Management</h3>
                            <p>Digital library system with advanced book tracking</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#featuresCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#featuresCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>