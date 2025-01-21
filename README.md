# html_content_measurer

The `html_content_measurer` package provides a utility to measure the height of dynamically rendered HTML content in a **web environment**. This package is specifically designed for web applications but can also coexist in projects that compile for both **web** and **Android** due to conditional imports.

## Features

- **Measure HTML Height**: Calculates the height of a given HTML content string by rendering it in an iframe and measuring its scroll height.
- **Responsive Measurement**: Automatically adjusts based on content load or resize events.
- **Clean Execution**: Ensures DOM elements and event listeners are cleaned up after measurement is complete.

## Getting Started

This package is designed primarily for **Dart or Flutter web applications**. However, it supports **multi-platform projects** with conditional imports, ensuring no runtime errors occur when running on **Android** or other non-web platforms.

### Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  html_content_measurer: ^1.0.0
