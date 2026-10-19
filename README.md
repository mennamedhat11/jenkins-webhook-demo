# Jenkins Webhook & Failure Notification Demo

A small practice repository for testing a **Jenkins** pipeline triggered automatically by a **GitHub push webhook**, with an email notification when a build fails.

## What it demonstrates

- Auto-triggering a Jenkins pipeline on every push (`githubPush()` trigger)
- A declarative pipeline with **Checkout** and **Run Code** stages
- Sending a failure email using the `post { failure { ... } }` block
- A simple shell script (`hello.sh`) used to simulate a passing/failing step

## Project Structure

```
.
├── .github/workflows/   # GitHub Actions workflows
├── Jenkinsfile          # Pipeline definition
├── hello.sh             # Demo script
└── README.md
```

## How it works

1. A push to the repository sends a webhook to Jenkins.
2. Jenkins checks out the code and runs the configured command.
3. If the build fails, an email is sent with the job name, build number and a link to the console logs.

## Setup

1. In Jenkins, create a Pipeline job from this repository.
2. Enable **GitHub hook trigger for GITScm polling**.
3. In GitHub, add a webhook pointing to `http://<jenkins-url>/github-webhook/`.
4. Configure SMTP settings in Jenkins to enable email notifications.

## Author

**Menna Medhat**
[GitHub](https://github.com/mennamedhat11)
