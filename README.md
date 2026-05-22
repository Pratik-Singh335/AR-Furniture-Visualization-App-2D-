# AR Furniture Visualization App (2D)

## Overview

This project is a **2D Augmented Reality (AR) furniture visualization application** that allows users to preview furniture in their real environment before making a purchase decision.

Unlike complex 3D AR systems, this application focuses on a **lightweight and practical 2D AR approach**, making it faster, more accessible, and easy to use on most devices.

The app helps users understand how furniture will look and fit in their space using real-time image processing.

---

## Key Features

- Upload or capture room images  
- Remove background using API integration (Remove.bg)  
- Place 2D furniture images in real-world scenes  
- Adjust position and scale of furniture  
- Simple and user-friendly interface  
- Fast processing without heavy 3D rendering  

---

## Technology Stack

- **Frontend:** HTML, CSS, JavaScript  
- **Backend:** Flask (Python)  
- **Image Processing:** PIL (Python Imaging Library)  
- **API Integration:** Remove.bg API  
- **Optional Enhancements:** OpenCV, Canvas rendering  

---

## How It Works

1. User uploads or captures an image of their room  
2. The system removes unnecessary background using Remove.bg API  
3. A catalog of furniture is displayed  
4. User selects a furniture item  
5. The selected item is placed in the image as a **2D AR overlay**  
6. User can resize and reposition the object to match their space  

---

## Problem Statement

Many users face difficulty in choosing the right furniture because:

- They cannot visualize how it will look in their room  
- Size and placement are often misjudged  
- Returns and dissatisfaction increase  

This application solves the problem by providing a **realistic preview before purchase**.

---

## Limitations

- Works on **2D AR (not full 3D visualization)**  
- Depth and lighting are approximated  
- Accuracy depends on image quality  

---

## Future Improvements

- AI-based size estimation  
- Better shadow and lighting adjustments  
- Furniture recommendation system  
- Mobile app version (Flutter integration)  
- E-commerce integration  

---

## Collaboration

This project is developed in collaboration with:

**Instagram:** [@ali_ibn_ejaz](https://instagram.com/ali_ibn_ejaz)

---

## Author
**Nidhish Shinde**
**Ali Ejaz**  
**Pratik Singh**  
