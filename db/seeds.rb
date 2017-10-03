# frozen_string_literal: true

User.all.delete_all


User.create!([
        {
          "lat": 2.0,
          "lng": 1.0,
          "image": "/img/scarjo.jpg",
          "tagline": "Studying for a law degree, in need of a coffee!"
        },
        {
          "lat": 2.0,
          "lng": 1.0,
          "image": "/img/estone.jpg",
          "tagline": "I may look like I‘m working but I‘m really watching cat videos"
        },
        {
          "lat": 2.0,
          "lng": 1.0,
          "image": "/img/ewatson.jpg",
          "tagline": "Looking for any excuse to take a break"
        }
    ]
)
