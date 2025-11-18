---
title: "Best Practices for ML in Geophysics"
layout: textlay
description: "A comprehensive checklist for machine learning papers in geophysics"
permalink: /pub_ml_rubric/
---

# **Best Practices for Machine Learning Papers in Geophysics**

*A Community Checklist for Imaging, Data Processing, and Earth-System Discovery*

Machine learning in geophysics spans three broad scientific goals:

1. **Subsurface Imaging & Monitoring**
   *Often simulation-trained; includes tomography, velocity model building, inversion surrogates, DAS imaging, monitoring of time-lapse structure, etc.*

2. **Data Processing & Catalog Building**
   *Includes earthquake detection, phase picking, classification, foundation models for seismic representation learning, and multimodal catalog creation.*

3. **Earth-System Discovery & Scientific Insight**
   *Includes ML for discovering new processes using multimodal data (remote sensing, seismology, hydrology, climate, geotechnical signals).*

Across all of these domains, the *baseline for rigor is the same.*
This checklist summarizes **what high-quality ML geophysics papers must report** to ensure scientific validity, reproducibility, and utility to the broader community.

---

# **1. Scientific Motivation & Positioning**

### **1.1 Problem framing**

* [ ] Clearly define the geophysical problem and why ML is appropriate for it.
* [ ] Explain the scientific or operational limitation of existing methods.
* [ ] Specify whether the task targets **imaging**, **processing**, or **discovery**, and define the success criteria.

### **1.2 Literature integration (required)**

* [ ] Situate the work in the context of **recent ML literature**,  
* [ ] Specify what is *new* beyond applying a known architecture.
* [ ] Compare against both **traditional geophysical methods** and **state-of-the-art ML models**.

---

# **2. Data, Simulations, & Preprocessing**

### **2.1 Dataset definition**

* [ ] Provide a complete description of all datasets: dimensions, sampling, components, labels, SNR, metadata, and known biases.
* [ ] **State explicitly whether data are synthetic, field, or mixed**, and justify how they represent the intended geophysical setting.
* [ ] For simulation-based studies: Provide details of numerical solver, physics, domain size, materials, and boundary conditions.
* [ ] For simulation-based studies: Quantify **compute resources required** to generate synthetic datasets (CPU/GPU hours, memory).

### **2.2 Preprocessing transparency**

* [ ] Describe *every* step: filtering, normalization, windowing, detrending, resampling, spectrogram parameters, etc.
* [ ] Include examples of **raw vs. processed** data to illustrate the transformations.
* [ ] Provide preprocessing scripts in a public repository.

### **2.3 Data realism & diversity**

* [ ] Assess representativeness relative to field conditions (noise, geometry, distance, heterogeneity).
* [ ] For simulations: Include variability in sources, noise, sensor layouts, and Earth structure.
* [ ] For simulations: Document limits of simulation generalization.

---

# **3. Model Architecture & Training**

### **3.1 Architecture clarity**

* [ ] Provide full model diagrams or tables of layers (include input/output shapes).
* [ ] Document architecture choices: encoders, decoders, skip connections, attention blocks, diffusion steps, normalizing flows, etc.
* [ ] Explain why the architecture is suited for the geophysical problem (physical symmetries, invariances, temporal structure).

### **3.2 Training protocol (required)**

* [ ] Report all training hyperparameters: learning rates, batch sizes, optimizers, losses, number of epochs, early stopping.
* [ ] Provide training curves (loss, validation metrics), not only final metrics.
* [ ] State **compute resources required for training** (GPUs used, GPU hours, memory footprint).

### **3.3 Baselines (required for publication)**

A strong ML geophysics paper **must** include:

* [ ] **Traditional geophysical baseline** (e.g., ray tomography, waveform inversion, matched filtering, STA/LTA).
* [ ] **Classical ML baseline** (e.g., random forest, shallow CNN, logistic regression).
* [ ] **Modern ML baseline** (e.g., U-Net, Transformer, diffusion models, neural operators, or SeisBench models).
* [ ] Comparison should include **quantitative metrics**, not only visuals.

### **3.4 Ablation studies (required)**

* [ ] Ablate major components: encoders, architectural depth, positional encodings, conditioning strength, features, data augmentations.
* [ ] For generative models: ablate inference settings (denoising steps, flow vs. diffusion strategies).
* [ ] For imaging models: ablate acquisition geometry, sensor coverage, SNR, and structural complexity.

---

# **4. Evaluation, Testing, and Generalization**

### **4.1 Metrics & benchmarks**

* [ ] Report physically meaningful metrics (e.g., velocity RMSE, structural misfit, SSIM, detection F1, hazard-relevant scores).
* [ ] Provide **full distributions**, confidence intervals, and class confusion matrices.

### **4.2 Generalization tests (strongly required for ML papers)**

* [ ] Test performance under changes in noise levels
* [ ] Test performance under changes in source locations
* [ ] Test performance under changes in acquisition geometry
* [ ] Test performance under changes in structural heterogeneity
* [ ] Test performance under changes in temporal drift
* [ ] Test performance under out-of-distribution examples
* [ ] For catalog-building studies: test on field datasets *from regions not used in training*.
* [ ] For imaging studies: test on unseen geologic structures, realistic noise, and perturbed sensor arrays.

### **4.3 Real-data realism**

* [ ] For synthetic-trained models, demonstrate at least one **bridge to field data** (transfer learning, adaptation, failure analysis, or why the model is not yet field-ready).

---

# **5. Computational Efficiency & Operational Usefulness**

This section responds to growing emphasis on operational feasibility.

### **5.1 Simulation cost**

* [ ] Report CPU/GPU hours, number of simulations, mesh size, and memory needed.

### **5.2 Training cost**

* [ ] List number of GPUs, GPU hours, wall time, energy or carbon cost (optional but encouraged).
* [ ] Provide model parameter count and checkpoint size.

### **5.3 Inference cost**

* [ ] Report inference time **per trace**, **per station-day**, or **per imaging experiment**.
* [ ] State memory footprint of the model during inference.
* [ ] Provide runtime benchmarks on common hardware (CPU-only and GPU).

### **5.4 Operational readiness**

* [ ] Describe whether the model can run in real time, on edge devices, or at cloud scale.
* [ ] Provide a Docker/Singularity environment or cloud examples if relevant.

---

# **6. Physical Consistency & Interpretability**

### **6.1 Physical priors and constraints**

* [ ] Discuss whether the model respects physical constraints (e.g., causality, monotonicity, wave propagation).
* [ ] For imaging/inversion: evaluate whether predictions obey known geophysical bounds.

### **6.2 Interpretability**

* [ ] Provide interpretable diagnostics (e.g., Integrated Gradients, feature importance, attribution maps).
* [ ] Reveal what signal components the model uses.

---

# **7. Reproducibility & Open Science**

### **7.1 Open code (required for modern ML)**

* [ ] Release full training, preprocessing, and inference code in a public repository.
* [ ] Provide tested scripts for reproducing all figures.
* [ ] Include environment files (requirements.txt or Conda YAML).

### **7.2 Open data**

* [ ] Release datasets or provide clear instructions for accessing them.
* [ ] If data are proprietary, provide synthetic analogs for reproducibility.

### **7.3 Model checkpoints**

* [ ] Release trained weights and configuration files.
* [ ] Provide sample inference notebooks.

### **7.4 Documentation**

* [ ] Provide a complete README including project structure
* [ ] Provide a complete README including dataset description
* [ ] Provide a complete README including training commands
* [ ] Provide a complete README including evaluation commands
* [ ] Provide a complete README including expected outputs

---

# **8. Writing for Dual Audiences (Geophysics + ML)**

* [ ] Define ML concepts clearly for geophysicists (e.g., flow matching, diffusion, transformers).
* [ ] Define geophysical concepts clearly for ML readers (e.g., P/S ratios, acquisition geometry).
* [ ] Include intuitive figures explaining the workflow.
* [ ] Provide geophysical interpretation of the ML results, not just numerical metrics.

---

# **Summary: What Makes an ML Paper Publishable in Geophysics?**

A strong ML geophysics paper:

1. **Advances a scientifically meaningful question**
2. **Uses physically realistic data and diverse tests**
3. **Provides rigorous baselines and ablations**
4. **Documents compute cost, training, and inference**
5. **Demonstrates generalization beyond the training set**
6. **Releases reproducible code and data**
7. **Speaks clearly to both geophysicists and ML practitioners**

This checklist reflects modern expectations shaped by **foundation-model research, multimodal geophysical ML, and open-science principles**, and is appropriate for imaging, catalog-building, and Earth-system discovery studies alike.

