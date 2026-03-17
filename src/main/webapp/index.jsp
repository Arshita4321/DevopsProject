<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Arshita Thakur | DevOps & Cloud Engineer</title>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Share+Tech+Mono&family=Rajdhani:wght@300;400;600&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --neon-cyan: #00f5ff;
      --neon-green: #39ff14;
      --neon-pink: #ff2d78;
      --neon-purple: #bf5af2;
      --dark-bg: #020409;
      --dark-card: #080d1a;
      --dark-border: #0d1f3c;
      --text-primary: #e0f7ff;
      --text-muted: #4a7a9b;
      --grid-line: rgba(0,245,255,0.04);
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      background: var(--dark-bg);
      color: var(--text-primary);
      font-family: 'Rajdhani', sans-serif;
      font-size: 16px;
      line-height: 1.7;
      overflow-x: hidden;
    }

    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background-image:
        linear-gradient(var(--grid-line) 1px, transparent 1px),
        linear-gradient(90deg, var(--grid-line) 1px, transparent 1px);
      background-size: 60px 60px;
      pointer-events: none;
      z-index: 0;
    }

    .orb { position: fixed; border-radius: 50%; filter: blur(120px); pointer-events: none; z-index: 0; opacity: 0.18; }
    .orb-1 { width: 500px; height: 500px; background: var(--neon-cyan); top: -150px; left: -150px; }
    .orb-2 { width: 400px; height: 400px; background: var(--neon-pink); bottom: 10%; right: -100px; }
    .orb-3 { width: 300px; height: 300px; background: var(--neon-purple); top: 40%; left: 30%; }

    nav {
      position: fixed; top: 0; left: 0; right: 0; z-index: 100;
      display: flex; justify-content: space-between; align-items: center;
      padding: 18px 60px;
      background: rgba(2,4,9,0.85);
      backdrop-filter: blur(20px);
      border-bottom: 1px solid var(--dark-border);
    }
    .nav-logo { font-family: 'Orbitron', monospace; font-weight: 900; font-size: 1.1rem; color: var(--neon-cyan); letter-spacing: 3px; text-shadow: 0 0 20px var(--neon-cyan); }
    .nav-links { display: flex; gap: 36px; list-style: none; }
    .nav-links a { font-family: 'Share Tech Mono', monospace; font-size: 0.8rem; color: var(--text-muted); text-decoration: none; letter-spacing: 2px; text-transform: uppercase; transition: color 0.3s, text-shadow 0.3s; }
    .nav-links a:hover { color: var(--neon-cyan); text-shadow: 0 0 12px var(--neon-cyan); }

    section { position: relative; z-index: 1; }

    #hero { min-height: 100vh; display: flex; flex-direction: column; justify-content: center; padding: 120px 60px 60px; max-width: 1200px; margin: 0 auto; }

    .hero-tag { font-family: 'Share Tech Mono', monospace; font-size: 0.8rem; color: var(--neon-green); letter-spacing: 4px; margin-bottom: 20px; animation: fadeSlideUp 0.6s ease forwards; opacity: 0; }
    .hero-name { font-family: 'Orbitron', monospace; font-size: clamp(2.8rem, 7vw, 5.5rem); font-weight: 900; line-height: 1.05; letter-spacing: -1px; animation: fadeSlideUp 0.8s 0.15s ease forwards; opacity: 0; }
    .hero-name span { display: block; background: linear-gradient(90deg, var(--neon-cyan), var(--neon-purple)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; filter: drop-shadow(0 0 30px rgba(0,245,255,0.4)); }
    .hero-role { font-family: 'Share Tech Mono', monospace; font-size: clamp(1rem, 2.5vw, 1.4rem); color: var(--neon-pink); margin-top: 16px; letter-spacing: 3px; animation: fadeSlideUp 0.8s 0.3s ease forwards; opacity: 0; }
    .hero-desc { max-width: 580px; margin-top: 28px; font-size: 1.1rem; color: var(--text-muted); font-weight: 300; animation: fadeSlideUp 0.8s 0.45s ease forwards; opacity: 0; }
    .hero-stats { display: flex; gap: 40px; margin-top: 48px; animation: fadeSlideUp 0.8s 0.6s ease forwards; opacity: 0; }
    .stat-item { text-align: left; }
    .stat-value { font-family: 'Orbitron', monospace; font-size: 2rem; font-weight: 700; color: var(--neon-cyan); text-shadow: 0 0 20px var(--neon-cyan); }
    .stat-label { font-family: 'Share Tech Mono', monospace; font-size: 0.7rem; color: var(--text-muted); letter-spacing: 2px; text-transform: uppercase; }
    .hero-ctas { display: flex; gap: 20px; margin-top: 48px; animation: fadeSlideUp 0.8s 0.75s ease forwards; opacity: 0; }

    .btn-primary { font-family: 'Orbitron', monospace; font-size: 0.75rem; font-weight: 700; letter-spacing: 2px; padding: 14px 34px; border: 2px solid var(--neon-cyan); color: var(--dark-bg); background: var(--neon-cyan); cursor: pointer; text-decoration: none; clip-path: polygon(8px 0%, 100% 0%, calc(100% - 8px) 100%, 0% 100%); transition: all 0.3s; box-shadow: 0 0 25px rgba(0,245,255,0.4); }
    .btn-primary:hover { background: transparent; color: var(--neon-cyan); box-shadow: 0 0 40px rgba(0,245,255,0.6); }
    .btn-secondary { font-family: 'Orbitron', monospace; font-size: 0.75rem; font-weight: 700; letter-spacing: 2px; padding: 14px 34px; border: 2px solid var(--neon-pink); color: var(--neon-pink); background: transparent; cursor: pointer; text-decoration: none; clip-path: polygon(8px 0%, 100% 0%, calc(100% - 8px) 100%, 0% 100%); transition: all 0.3s; }
    .btn-secondary:hover { background: var(--neon-pink); color: var(--dark-bg); box-shadow: 0 0 30px rgba(255,45,120,0.5); }

    .scroll-hint { position: absolute; bottom: 40px; left: 60px; display: flex; align-items: center; gap: 12px; font-family: 'Share Tech Mono', monospace; font-size: 0.7rem; color: var(--text-muted); letter-spacing: 2px; animation: fadeSlideUp 0.8s 1s ease forwards; opacity: 0; }
    .scroll-line { width: 40px; height: 1px; background: var(--neon-cyan); animation: pulseWidth 2s ease-in-out infinite; }

    .section-inner { max-width: 1200px; margin: 0 auto; padding: 100px 60px; }
    .section-header { display: flex; align-items: center; gap: 20px; margin-bottom: 60px; }
    .section-number { font-family: 'Share Tech Mono', monospace; font-size: 0.75rem; color: var(--neon-pink); letter-spacing: 2px; }
    .section-title { font-family: 'Orbitron', monospace; font-size: clamp(1.6rem, 4vw, 2.4rem); font-weight: 700; color: var(--text-primary); letter-spacing: 2px; }
    .section-line { flex: 1; height: 1px; background: linear-gradient(90deg, var(--neon-cyan), transparent); }

    #about { background: rgba(8,13,26,0.5); }
    .about-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: start; }
    .about-text p { color: var(--text-muted); font-size: 1.05rem; margin-bottom: 20px; font-weight: 300; }
    .about-text p strong { color: var(--neon-cyan); font-weight: 600; }
    .about-info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
    .info-card { background: var(--dark-card); border: 1px solid var(--dark-border); border-left: 3px solid var(--neon-cyan); padding: 18px 20px; transition: border-color 0.3s, box-shadow 0.3s; }
    .info-card:hover { border-left-color: var(--neon-pink); box-shadow: -4px 0 20px rgba(255,45,120,0.2); }
    .info-card-label { font-family: 'Share Tech Mono', monospace; font-size: 0.65rem; color: var(--text-muted); letter-spacing: 2px; text-transform: uppercase; margin-bottom: 6px; }
    .info-card-value { font-size: 0.95rem; color: var(--text-primary); font-weight: 600; }

    .skills-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(340px, 1fr)); gap: 24px; }
    .skill-category { background: var(--dark-card); border: 1px solid var(--dark-border); padding: 30px; position: relative; overflow: hidden; transition: transform 0.3s, box-shadow 0.3s; }
    .skill-category::before { content: ''; position: absolute; top: 0; left: 0; right: 0; height: 2px; background: linear-gradient(90deg, var(--neon-cyan), var(--neon-purple)); }
    .skill-category:hover { transform: translateY(-4px); box-shadow: 0 20px 40px rgba(0,0,0,0.4), 0 0 40px rgba(0,245,255,0.06); }
    .skill-cat-title { font-family: 'Orbitron', monospace; font-size: 0.8rem; font-weight: 700; color: var(--neon-cyan); letter-spacing: 3px; margin-bottom: 20px; text-transform: uppercase; }
    .skill-tags { display: flex; flex-wrap: wrap; gap: 10px; }
    .skill-tag { font-family: 'Share Tech Mono', monospace; font-size: 0.78rem; padding: 6px 14px; border: 1px solid; letter-spacing: 1px; transition: all 0.25s; cursor: default; }
    .tag-cyan  { border-color: rgba(0,245,255,0.3);  color: var(--neon-cyan);   }
    .tag-green { border-color: rgba(57,255,20,0.3);  color: var(--neon-green);  }
    .tag-pink  { border-color: rgba(255,45,120,0.3); color: var(--neon-pink);   }
    .tag-purple{ border-color: rgba(191,90,242,0.3); color: var(--neon-purple); }
    .skill-tag:hover { background: currentColor; color: var(--dark-bg); box-shadow: 0 0 16px currentColor; }

    #projects { background: rgba(8,13,26,0.5); }
    .projects-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(340px, 1fr)); gap: 28px; }
    .project-card { background: var(--dark-card); border: 1px solid var(--dark-border); padding: 32px; position: relative; overflow: hidden; transition: transform 0.3s, box-shadow 0.3s; cursor: default; }
    .project-card::after { content: ''; position: absolute; bottom: 0; left: 0; right: 0; height: 2px; background: linear-gradient(90deg, var(--neon-pink), var(--neon-purple)); transform: scaleX(0); transition: transform 0.4s; }
    .project-card:hover { transform: translateY(-6px); box-shadow: 0 24px 50px rgba(0,0,0,0.5), 0 0 40px rgba(255,45,120,0.08); }
    .project-card:hover::after { transform: scaleX(1); }
    .project-number { font-family: 'Orbitron', monospace; font-size: 3rem; font-weight: 900; color: rgba(0,245,255,0.06); position: absolute; top: 16px; right: 20px; line-height: 1; }
    .project-type { font-family: 'Share Tech Mono', monospace; font-size: 0.68rem; color: var(--neon-pink); letter-spacing: 3px; text-transform: uppercase; margin-bottom: 12px; }
    .project-title { font-family: 'Orbitron', monospace; font-size: 1.1rem; font-weight: 700; color: var(--text-primary); margin-bottom: 14px; letter-spacing: 1px; }
    .project-desc { font-size: 0.95rem; color: var(--text-muted); font-weight: 300; margin-bottom: 22px; line-height: 1.6; }
    .project-tech { display: flex; flex-wrap: wrap; gap: 8px; }
    .tech-pill { font-family: 'Share Tech Mono', monospace; font-size: 0.7rem; padding: 4px 12px; background: rgba(0,245,255,0.07); border: 1px solid rgba(0,245,255,0.15); color: var(--neon-cyan); letter-spacing: 1px; }

    .timeline { position: relative; padding-left: 40px; }
    .timeline::before { content: ''; position: absolute; left: 0; top: 0; bottom: 0; width: 1px; background: linear-gradient(180deg, var(--neon-cyan), var(--neon-purple), transparent); }
    .timeline-item { position: relative; margin-bottom: 50px; }
    .timeline-item::before { content: ''; position: absolute; left: -46px; top: 6px; width: 12px; height: 12px; background: var(--neon-cyan); border-radius: 50%; box-shadow: 0 0 16px var(--neon-cyan); }
    .timeline-date { font-family: 'Share Tech Mono', monospace; font-size: 0.7rem; color: var(--neon-green); letter-spacing: 2px; margin-bottom: 8px; }
    .timeline-role { font-family: 'Orbitron', monospace; font-size: 1rem; font-weight: 700; color: var(--text-primary); margin-bottom: 4px; }
    .timeline-company { font-size: 0.9rem; color: var(--neon-pink); font-weight: 600; margin-bottom: 12px; }
    .timeline-desc { font-size: 0.95rem; color: var(--text-muted); font-weight: 300; }

    #education { background: rgba(8,13,26,0.5); }
    .edu-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; }
    .edu-card { background: var(--dark-card); border: 1px solid var(--dark-border); padding: 32px; position: relative; overflow: hidden; transition: transform 0.3s; }
    .edu-card::before { content: ''; position: absolute; top: 0; left: 0; width: 3px; height: 100%; background: linear-gradient(180deg, var(--neon-cyan), var(--neon-purple)); }
    .edu-card:hover { transform: translateX(6px); }
    .edu-degree { font-family: 'Orbitron', monospace; font-size: 0.95rem; font-weight: 700; color: var(--text-primary); margin-bottom: 8px; letter-spacing: 1px; }
    .edu-school { font-size: 1rem; color: var(--neon-cyan); font-weight: 600; margin-bottom: 6px; }
    .edu-year { font-family: 'Share Tech Mono', monospace; font-size: 0.75rem; color: var(--text-muted); letter-spacing: 2px; margin-bottom: 12px; }
    .edu-cgpa { display: inline-block; font-family: 'Orbitron', monospace; font-size: 0.8rem; padding: 6px 14px; border: 1px solid var(--neon-green); color: var(--neon-green); letter-spacing: 1px; text-shadow: 0 0 10px var(--neon-green); }

    .certs-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; }
    .cert-card { background: var(--dark-card); border: 1px solid var(--dark-border); padding: 24px; display: flex; align-items: flex-start; gap: 18px; transition: transform 0.3s, box-shadow 0.3s; }
    .cert-card:hover { transform: translateY(-4px); box-shadow: 0 16px 40px rgba(0,0,0,0.4), 0 0 30px rgba(191,90,242,0.1); }
    .cert-icon { font-size: 1.8rem; line-height: 1; flex-shrink: 0; }
    .cert-name { font-family: 'Orbitron', monospace; font-size: 0.8rem; font-weight: 700; color: var(--text-primary); margin-bottom: 6px; letter-spacing: 1px; }
    .cert-issuer { font-family: 'Share Tech Mono', monospace; font-size: 0.72rem; color: var(--neon-purple); letter-spacing: 1px; }

    #contact { background: linear-gradient(180deg, var(--dark-bg) 0%, rgba(0,245,255,0.02) 100%); }
    .contact-wrapper { display: grid; grid-template-columns: 1fr 1fr; gap: 80px; align-items: start; }
    .contact-tagline { font-family: 'Orbitron', monospace; font-size: clamp(1.4rem, 3vw, 2rem); font-weight: 700; color: var(--text-primary); line-height: 1.3; margin-bottom: 20px; }
    .contact-tagline span { color: var(--neon-cyan); }
    .contact-sub { font-size: 1rem; color: var(--text-muted); font-weight: 300; margin-bottom: 40px; }
    .contact-links { display: flex; flex-direction: column; gap: 16px; }
    .contact-link { display: flex; align-items: center; gap: 14px; text-decoration: none; color: var(--text-muted); font-size: 0.95rem; padding: 14px 20px; border: 1px solid transparent; transition: all 0.3s; }
    .contact-link:hover { color: var(--neon-cyan); border-color: var(--dark-border); background: rgba(0,245,255,0.04); }
    .contact-link-icon { font-size: 1.2rem; color: var(--neon-cyan); }
    .contact-link-label { font-family: 'Share Tech Mono', monospace; font-size: 0.7rem; color: var(--text-muted); letter-spacing: 2px; display: block; margin-bottom: 2px; }
    .contact-form { display: flex; flex-direction: column; gap: 18px; }
    .form-group { display: flex; flex-direction: column; gap: 8px; }
    .form-label { font-family: 'Share Tech Mono', monospace; font-size: 0.7rem; color: var(--neon-cyan); letter-spacing: 2px; text-transform: uppercase; }
    .form-input, .form-textarea { background: var(--dark-card); border: 1px solid var(--dark-border); color: var(--text-primary); font-family: 'Rajdhani', sans-serif; font-size: 1rem; padding: 14px 18px; outline: none; transition: border-color 0.3s, box-shadow 0.3s; }
    .form-input:focus, .form-textarea:focus { border-color: var(--neon-cyan); box-shadow: 0 0 20px rgba(0,245,255,0.1); }
    .form-textarea { resize: vertical; min-height: 120px; }

    footer { position: relative; z-index: 1; text-align: center; padding: 40px; border-top: 1px solid var(--dark-border); }
    footer p { font-family: 'Share Tech Mono', monospace; font-size: 0.75rem; color: var(--text-muted); letter-spacing: 2px; }
    footer span { color: var(--neon-pink); }

    @keyframes fadeSlideUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
    @keyframes pulseWidth { 0%, 100% { width: 40px; } 50% { width: 60px; } }
    @keyframes blink { 0%, 100% { opacity: 1; } 50% { opacity: 0; } }

    .cursor-blink { display: inline-block; color: var(--neon-cyan); animation: blink 1s step-end infinite; }

    .reveal { opacity: 0; transform: translateY(40px); transition: opacity 0.7s ease, transform 0.7s ease; }
    .reveal.visible { opacity: 1; transform: translateY(0); }

    @media (max-width: 768px) {
      nav { padding: 16px 24px; }
      .nav-links { display: none; }
      #hero, .section-inner { padding-left: 24px; padding-right: 24px; }
      .about-grid, .contact-wrapper, .edu-grid { grid-template-columns: 1fr; }
      .hero-stats { gap: 24px; flex-wrap: wrap; }
      .scroll-hint { display: none; }
    }
  </style>
</head>
<body>

  <div class="orb orb-1"></div>
  <div class="orb orb-2"></div>
  <div class="orb orb-3"></div>

  <nav>
    <div class="nav-logo">AT_</div>
    <ul class="nav-links">
      <li><a href="#about">About</a></li>
      <li><a href="#skills">Skills</a></li>
      <li><a href="#projects">Projects</a></li>
      <li><a href="#experience">Experience</a></li>
      <li><a href="#education">Education</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
  </nav>

  <!-- HERO -->
  <section id="hero">
    <div style="max-width:1200px; margin:0 auto; position:relative;">
      <p class="hero-tag">&gt; INITIALIZING PORTFOLIO.SYS<span class="cursor-blink">_</span></p>
      <h1 class="hero-name">ARSHITA<span>THAKUR</span></h1>
      <p class="hero-role">// DevOps &amp; Cloud Engineer</p>
      <p class="hero-desc">Architecting scalable cloud infrastructure and automating CI/CD pipelines. Passionate about bridging the gap between development and operations through cutting-edge cloud technologies and DevOps best practices.</p>
      <div class="hero-stats">
        <div class="stat-item"><div class="stat-value">8.95</div><div class="stat-label">CGPA</div></div>
        <div class="stat-item"><div class="stat-value">15+</div><div class="stat-label">Projects</div></div>
        <div class="stat-item"><div class="stat-value">5+</div><div class="stat-label">Certifications</div></div>
        <div class="stat-item"><div class="stat-value">3+</div><div class="stat-label">Internships</div></div>
      </div>
      <div class="hero-ctas">
        <a href="#projects" class="btn-primary">VIEW PROJECTS</a>
        <a href="#contact" class="btn-secondary">HIRE ME</a>
      </div>
      <div class="scroll-hint"><div class="scroll-line"></div>SCROLL TO EXPLORE</div>
    </div>
  </section>

  <!-- ABOUT -->
  <section id="about">
    <div class="section-inner">
      <div class="section-header reveal">
        <span class="section-number">01</span>
        <h2 class="section-title">ABOUT ME</h2>
        <div class="section-line"></div>
      </div>
      <div class="about-grid">
        <div class="about-text reveal">
          <p>I'm <strong>Arshita Thakur</strong>, a passionate DevOps &amp; Cloud Engineer with a strong foundation in software development and cloud infrastructure. I specialize in building automated pipelines, deploying scalable systems on AWS, and containerizing applications with Docker.</p>
          <p>With a knack for <strong>problem-solving</strong> and a deep interest in machine learning, I bridge the gap between data science and production-grade deployment. I thrive in collaborative environments and love turning complex infrastructure challenges into elegant, automated solutions.</p>
          <p>When I'm not engineering pipelines, I'm exploring open-source projects, contributing to tech communities, and sharpening my skills in competitive programming.</p>
        </div>
        <div class="about-info-grid reveal">
          <div class="info-card"><div class="info-card-label">Location</div><div class="info-card-value">Punjab, India</div></div>
          <div class="info-card"><div class="info-card-label">CGPA</div><div class="info-card-value">8.95 / 10.0</div></div>
          <div class="info-card"><div class="info-card-label">Status</div><div class="info-card-value">Open to Work</div></div>
          <div class="info-card"><div class="info-card-label">Focus</div><div class="info-card-value">Cloud &amp; DevOps</div></div>
          <div class="info-card"><div class="info-card-label">Languages</div><div class="info-card-value">English, Hindi</div></div>
          <div class="info-card"><div class="info-card-label">Availability</div><div class="info-card-value">Immediate</div></div>
        </div>
      </div>
    </div>
  </section>

  <!-- SKILLS -->
  <section id="skills">
    <div class="section-inner">
      <div class="section-header reveal">
        <span class="section-number">02</span>
        <h2 class="section-title">TECH STACK</h2>
        <div class="section-line"></div>
      </div>
      <div class="skills-grid">
        <div class="skill-category reveal">
          <div class="skill-cat-title">// Languages</div>
          <div class="skill-tags">
            <span class="skill-tag tag-cyan">C</span>
            <span class="skill-tag tag-cyan">C++</span>
            <span class="skill-tag tag-cyan">Python</span>
            <span class="skill-tag tag-cyan">JavaScript</span>
            <span class="skill-tag tag-cyan">HTML</span>
            <span class="skill-tag tag-cyan">CSS</span>
            <span class="skill-tag tag-cyan">Java</span>
          </div>
        </div>
        <div class="skill-category reveal">
          <div class="skill-cat-title">// Frameworks</div>
          <div class="skill-tags">
            <span class="skill-tag tag-green">ReactJS</span>
            <span class="skill-tag tag-green">NodeJS</span>
            <span class="skill-tag tag-green">NumPy</span>
            <span class="skill-tag tag-green">Pandas</span>
            <span class="skill-tag tag-green">Matplotlib</span>
            <span class="skill-tag tag-green">Seaborn</span>
            <span class="skill-tag tag-green">Scikit-learn</span>
          </div>
        </div>
        <div class="skill-category reveal">
          <div class="skill-cat-title">// DevOps &amp; Cloud</div>
          <div class="skill-tags">
            <span class="skill-tag tag-pink">Git</span>
            <span class="skill-tag tag-pink">GitHub</span>
            <span class="skill-tag tag-pink">GitHub Actions</span>
            <span class="skill-tag tag-pink">Maven</span>
            <span class="skill-tag tag-pink">Docker</span>
            <span class="skill-tag tag-pink">AWS EC2</span>
            <span class="skill-tag tag-pink">AWS S3</span>
            <span class="skill-tag tag-pink">AWS IAM</span>
            <span class="skill-tag tag-pink">AWS VPC</span>
            <span class="skill-tag tag-pink">Ubuntu/Linux</span>
            <span class="skill-tag tag-pink">Jenkins</span>
          </div>
        </div>
        <div class="skill-category reveal">
          <div class="skill-cat-title">// Databases &amp; Soft Skills</div>
          <div class="skill-tags">
            <span class="skill-tag tag-purple">MySQL</span>
            <span class="skill-tag tag-purple">MongoDB</span>
            <span class="skill-tag tag-cyan">Problem-Solving</span>
            <span class="skill-tag tag-cyan">Communication</span>
            <span class="skill-tag tag-cyan">Team Collaboration</span>
            <span class="skill-tag tag-cyan">Time Management</span>
            <span class="skill-tag tag-cyan">Resilience</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- PROJECTS -->
  <section id="projects">
    <div class="section-inner">
      <div class="section-header reveal">
        <span class="section-number">03</span>
        <h2 class="section-title">PROJECTS</h2>
        <div class="section-line"></div>
      </div>
      <div class="projects-grid">
        <div class="project-card reveal">
          <div class="project-number">01</div>
          <div class="project-type">// DevOps</div>
          <div class="project-title">CI/CD PIPELINE AUTOMATION</div>
          <div class="project-desc">Built a fully automated CI/CD pipeline using Jenkins, Docker, and GitHub Actions. Integrated automated testing, containerized builds, and zero-downtime deployments on AWS EC2.</div>
          <div class="project-tech"><span class="tech-pill">Jenkins</span><span class="tech-pill">Docker</span><span class="tech-pill">GitHub Actions</span><span class="tech-pill">AWS EC2</span></div>
        </div>
        <div class="project-card reveal">
          <div class="project-number">02</div>
          <div class="project-type">// Cloud</div>
          <div class="project-title">AWS SERVERLESS INFRASTRUCTURE</div>
          <div class="project-desc">Designed and deployed a scalable serverless architecture using AWS services. Implemented VPC networking, IAM roles, and S3 static hosting with CloudFront CDN.</div>
          <div class="project-tech"><span class="tech-pill">AWS S3</span><span class="tech-pill">AWS IAM</span><span class="tech-pill">AWS VPC</span><span class="tech-pill">CloudFront</span></div>
        </div>
        <div class="project-card reveal">
          <div class="project-number">03</div>
          <div class="project-type">// Machine Learning</div>
          <div class="project-title">PREDICTIVE ANALYTICS DASHBOARD</div>
          <div class="project-desc">Developed an end-to-end ML pipeline for real-time data analysis and predictive modeling. Visualized results through an interactive React dashboard with live data streaming.</div>
          <div class="project-tech"><span class="tech-pill">Python</span><span class="tech-pill">Scikit-learn</span><span class="tech-pill">Pandas</span><span class="tech-pill">ReactJS</span></div>
        </div>
        <div class="project-card reveal">
          <div class="project-number">04</div>
          <div class="project-type">// Full Stack</div>
          <div class="project-title">CONTAINERIZED MICROSERVICES APP</div>
          <div class="project-desc">Built a microservices-based e-commerce backend using Node.js and Docker Compose. Deployed on AWS with MySQL and MongoDB for hybrid database management.</div>
          <div class="project-tech"><span class="tech-pill">NodeJS</span><span class="tech-pill">Docker</span><span class="tech-pill">MySQL</span><span class="tech-pill">MongoDB</span></div>
        </div>
        <div class="project-card reveal">
          <div class="project-number">05</div>
          <div class="project-type">// Data Science</div>
          <div class="project-title">SENTIMENT ANALYSIS ENGINE</div>
          <div class="project-desc">Designed a real-time sentiment analysis system processing social media data streams. Leveraged NLP techniques with visual reporting using Seaborn and Matplotlib.</div>
          <div class="project-tech"><span class="tech-pill">Python</span><span class="tech-pill">NLP</span><span class="tech-pill">Seaborn</span><span class="tech-pill">Matplotlib</span></div>
        </div>
        <div class="project-card reveal">
          <div class="project-number">06</div>
          <div class="project-type">// DevOps</div>
          <div class="project-title">INFRASTRUCTURE AS CODE (IaC)</div>
          <div class="project-desc">Automated AWS infrastructure provisioning using shell scripts and GitHub Actions workflows. Reduced deployment time by 70% through reusable infrastructure templates.</div>
          <div class="project-tech"><span class="tech-pill">AWS</span><span class="tech-pill">GitHub Actions</span><span class="tech-pill">Linux</span><span class="tech-pill">Maven</span></div>
        </div>
      </div>
    </div>
  </section>

  <!-- EXPERIENCE -->
  <section id="experience">
    <div class="section-inner">
      <div class="section-header reveal">
        <span class="section-number">04</span>
        <h2 class="section-title">EXPERIENCE</h2>
        <div class="section-line"></div>
      </div>
      <div class="timeline reveal">
        <div class="timeline-item">
          <div class="timeline-date">JAN 2024 — MAY 2024</div>
          <div class="timeline-role">Cloud &amp; DevOps Intern</div>
          <div class="timeline-company">TechNova Solutions Pvt. Ltd.</div>
          <div class="timeline-desc">Assisted in managing AWS infrastructure, configuring EC2 instances and S3 buckets. Automated build and deployment workflows using Jenkins and GitHub Actions, reducing manual intervention by 60%.</div>
        </div>
        <div class="timeline-item">
          <div class="timeline-date">JUN 2023 — AUG 2023</div>
          <div class="timeline-role">Machine Learning Intern</div>
          <div class="timeline-company">DataPulse Analytics</div>
          <div class="timeline-desc">Developed and trained classification models using Scikit-learn on large datasets. Built data visualizations with Matplotlib and Seaborn to present model insights to stakeholders.</div>
        </div>
        <div class="timeline-item">
          <div class="timeline-date">DEC 2022 — FEB 2023</div>
          <div class="timeline-role">Full Stack Developer Intern</div>
          <div class="timeline-company">CodeBridge Technologies</div>
          <div class="timeline-desc">Built responsive web applications using ReactJS and Node.js. Integrated MongoDB databases and implemented RESTful APIs for a SaaS product serving 2000+ users.</div>
        </div>
      </div>
    </div>
  </section>

  <!-- EDUCATION -->
  <section id="education">
    <div class="section-inner">
      <div class="section-header reveal">
        <span class="section-number">05</span>
        <h2 class="section-title">EDUCATION</h2>
        <div class="section-line"></div>
      </div>
      <div class="edu-grid">
        <div class="edu-card reveal">
          <div class="edu-degree">B.Tech — Computer Science &amp; Engineering</div>
          <div class="edu-school">Lovely Professional University</div>
          <div class="edu-year">2021 — 2025</div>
          <div class="edu-cgpa">CGPA: 8.95 / 10.0</div>
        </div>
        <div class="edu-card reveal">
          <div class="edu-degree">Senior Secondary (XII) — PCM</div>
          <div class="edu-school">DAV Senior Secondary School</div>
          <div class="edu-year">2019 — 2021</div>
          <div class="edu-cgpa">Percentage: 92.4%</div>
        </div>
      </div>
    </div>
  </section>

  <!-- CERTIFICATIONS -->
  <section id="certifications">
    <div class="section-inner">
      <div class="section-header reveal">
        <span class="section-number">06</span>
        <h2 class="section-title">CERTIFICATIONS</h2>
        <div class="section-line"></div>
      </div>
      <div class="certs-grid">
        <div class="cert-card reveal"><div class="cert-icon">☁️</div><div><div class="cert-name">AWS Cloud Practitioner</div><div class="cert-issuer">Amazon Web Services · 2024</div></div></div>
        <div class="cert-card reveal"><div class="cert-icon">🐳</div><div><div class="cert-name">Docker Fundamentals</div><div class="cert-issuer">Docker Inc. · 2023</div></div></div>
        <div class="cert-card reveal"><div class="cert-icon">⚙️</div><div><div class="cert-name">DevOps on AWS Specialization</div><div class="cert-issuer">Coursera · 2024</div></div></div>
        <div class="cert-card reveal"><div class="cert-icon">🤖</div><div><div class="cert-name">Machine Learning A-Z</div><div class="cert-issuer">Udemy · 2023</div></div></div>
        <div class="cert-card reveal"><div class="cert-icon">🔧</div><div><div class="cert-name">Jenkins Certified Engineer</div><div class="cert-issuer">CloudBees · 2024</div></div></div>
      </div>
    </div>
  </section>

  <!-- CONTACT -->
  <section id="contact">
    <div class="section-inner">
      <div class="section-header reveal">
        <span class="section-number">07</span>
        <h2 class="section-title">CONTACT</h2>
        <div class="section-line"></div>
      </div>
      <div class="contact-wrapper">
        <div class="reveal">
          <h3 class="contact-tagline">Let's Build Something <span>Extraordinary</span> Together</h3>
          <p class="contact-sub">Open to full-time opportunities, freelance projects, and collaborations in DevOps, Cloud Engineering, and ML deployment.</p>
          <div class="contact-links">
            <a href="mailto:arshita.thakur@email.com" class="contact-link">
              <span class="contact-link-icon">✉</span>
              <div><span class="contact-link-label">EMAIL</span>arshita.thakur@email.com</div>
            </a>
            <a href="https://linkedin.com/in/arshitathakur" target="_blank" class="contact-link">
              <span class="contact-link-icon">💼</span>
              <div><span class="contact-link-label">LINKEDIN</span>linkedin.com/in/arshitathakur</div>
            </a>
            <a href="https://github.com/arshitathakur" target="_blank" class="contact-link">
              <span class="contact-link-icon">⌥</span>
              <div><span class="contact-link-label">GITHUB</span>github.com/arshitathakur</div>
            </a>
          </div>
        </div>
        <div class="contact-form reveal">
          <div class="form-group"><label class="form-label">NAME</label><input type="text" class="form-input" placeholder="Your name" /></div>
          <div class="form-group"><label class="form-label">EMAIL</label><input type="email" class="form-input" placeholder="your@email.com" /></div>
          <div class="form-group"><label class="form-label">MESSAGE</label><textarea class="form-textarea" placeholder="Tell me about your project..."></textarea></div>
          <button class="btn-primary" style="width:100%; font-size:0.8rem;" onclick="alert('Connect to a backend to enable sending!')">SEND MESSAGE</button>
        </div>
      </div>
    </div>
  </section>

  <footer>
    <p>&copy; 2025 <span>ARSHITA THAKUR</span> · DESIGNED &amp; CODED WITH <span>♥</span> · ALL SYSTEMS OPERATIONAL</p>
  </footer>

  <script>
    const reveals = document.querySelectorAll('.reveal');
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry, i) => {
        if (entry.isIntersecting) {
          setTimeout(() => entry.target.classList.add('visible'), i * 80);
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.1 });
    reveals.forEach(el => observer.observe(el));

    const tag = document.querySelector('.hero-tag');
    const text = '> INITIALIZING PORTFOLIO.SYS';
    tag.innerHTML = '';
    let i = 0;
    function type() {
      if (i < text.length) {
        tag.innerHTML = text.slice(0, ++i) + '<span class="cursor-blink">_</span>';
        setTimeout(type, 60);
      }
    }
    setTimeout(type, 400);

    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-links a');
    window.addEventListener('scroll', () => {
      let current = '';
      sections.forEach(sec => {
        if (window.scrollY >= sec.offsetTop - 100) current = sec.getAttribute('id');
      });
      navLinks.forEach(a => {
        a.style.color = a.getAttribute('href') === '#' + current ? 'var(--neon-cyan)' : '';
      });
    });
  </script>

</body>
</html>