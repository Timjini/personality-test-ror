# 🧠 Personality Test App

A lightweight Rails app that lets users take a quick personality quiz and instantly see their results — no database required.

## 🛠️ Tech Stack

- **Ruby on Rails** (Sessions + Rails Cache)
- **StimulusJS** (for frontend interactivity)

## 💡 How It Works

- The app shows a series of simple questions using Stimulus controllers.
- User answers are stored in the **Rails session**.
- Once completed, the app calculates the result and caches it using **Rails.cache**.
- No sign-up, no storage — just fast and ephemeral.

## 📸 Screenshot

![App Screenshot](/personality-test.png)

## 🧪 Ideal For

- Quick personality or preference quizzes
- MVP testing
- Session-based apps without persistent storage

---
