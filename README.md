# Jenkins Webhook Demo

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Jenkins](https://img.shields.io/badge/CI-Jenkins-D24939?logo=jenkins&logoColor=white)
![Shell](https://img.shields.io/badge/Script-Bash-4EAA25?logo=gnubash&logoColor=white)

A small practice repository for testing a **Jenkins** pipeline that is triggered automatically by a **GitHub push webhook**, with an **email notification** when a build fails.

## What it demonstrates

- Auto-triggering a Jenkins pipeline on every push (`githubPush()` trigger)
- A declarative pipeline with **Checkout** and **Run Code** stages
- Sending a failure email from the `post { failure { ... } }` block
- A simple shell script (`hello.sh`) used to simulate a passing or failing step

## Project structure

```
.
├── .github/workflows/   # GitHub Actions workflows
├── Jenkinsfile          # Pipeline definition
├── hello.sh             # Demo script (passes by default)
├── LICENSE
└── README.md
```

## How it works

1. A push to the repository sends a webhook to Jenkins.
2. Jenkins checks out the code and runs `hello.sh`.
3. If the build fails, an email is sent with the job name, build number and a link to the console logs.

## Setup

1. In Jenkins, create a **Pipeline** job from this repository.
2. Enable **GitHub hook trigger for GITScm polling**.
3. In GitHub, go to **Settings > Webhooks** and add a webhook pointing to `http://<jenkins-url>/github-webhook/` (content type `application/json`).
4. Configure SMTP settings in Jenkins (**Manage Jenkins > System > E-mail Notification**).
5. Set the `NOTIFY_EMAIL` environment variable in Jenkins (**Manage Jenkins > System > Global properties > Environment variables**) to the address that should receive failure emails. It is not stored in the repository on purpose.

## How to test a failure

Run the script with `FAIL=1`, or temporarily change the pipeline step to:

```groovy
sh 'FAIL=1 ./hello.sh'
```

Push the change. The build should fail and a failure email should arrive.

## Troubleshooting

| Problem | What to check |
| --- | --- |
| Build does not start on push | In GitHub, open the webhook's **Recent Deliveries** and confirm a `200` response. Check that the Jenkins URL is reachable from the internet. |
| `Permission denied` on `hello.sh` | The pipeline runs `chmod +x hello.sh` first. Make sure the file is in the repo root. |
| No failure email | Verify the SMTP settings and that `NOTIFY_EMAIL` is set in Jenkins. |

## Author

**Menna Medhat**
[GitHub](https://github.com/mennamedhat11)

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
