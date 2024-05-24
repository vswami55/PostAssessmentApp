# AssessmentApp

AssessmentApp is an iOS application built using Swift, employing the MVVM (Model-View-ViewModel) architecture. This app demonstrates how to fetch data from an API with pagination and display it in a `UITableView`. It also includes a detail view for individual posts and shows a loading indicator during API calls.

## Features

- Fetch posts from a REST API with pagination.
- Display posts in a `UITableView`.
- Navigate to a detail view to show the full content of a post.
- Display a loading indicator during API calls.
- Error handling with user alerts.

## Architecture

This project follows the MVVM architecture to separate concerns and improve code maintainability.

- **Model**: Represents the data and business logic.
- **View**: Represents the UI components.
- **ViewModel**: Handles the presentation logic and updates the view.

## Project Structure

```plaintext
AssessmentApp/
├── AssessmentApp/
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── Constants.swift
│   ├── Model/
│   │   └── Post.swift
│   ├── View/
│   │   ├── ViewController.swift
│   │   ├── PostDetailVC.swift
│   ├── ViewModel/
│   │   └── PostsViewModel.swift
├── README.md
├── Info.plist
