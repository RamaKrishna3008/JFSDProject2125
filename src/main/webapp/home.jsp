<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University - ERP </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        :root {
            --bs-primary: #4a90e2;
            --bs-secondary: #2c3e50;
            --bs-light: #f8f9fa;
            --bs-dark: #212529;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        .hero {
            background: linear-gradient(135deg, var(--bs-primary), var(--bs-secondary));
            position: relative;
            overflow: hidden;
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

        .feature-card {
            transition: all 0.3s ease;
            transform: translateY(0);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 1rem 3rem rgba(0,0,0,.175) !important;
        }

        .feature-icon {
            transition: transform 0.3s ease;
            color: var(--bs-primary);
        }

        .feature-card:hover .feature-icon {
            transform: rotate(360deg);
        }

    .carousel-inner img {
        height: 500px; /* Adjust height as needed */
        object-fit: cover;
    }

    .carousel-caption {
        z-index: 2;
        color: #fff;
        text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
    }

    .carousel-item {
        position: relative;
    }

    .carousel-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3));
        z-index: 1;
    }

    .carousel-control-prev-icon,
    .carousel-control-next-icon {
        background-color: rgba(0, 0, 0, 0.5);
        border-radius: 50%;
        padding: 10px;
    }

    .carousel-indicators [data-bs-target] {
        background-color: #4a90e2;
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
    </style>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3">
        <div class="container">
            <a class="navbar-brand fw-bold" href="login">
                <i class="fas fa-graduation-cap me-2"></i>SHS University
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