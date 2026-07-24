# SRE / DevOps Learning Hub

Learn Docker, Kubernetes, and site reliability **by doing** — a set of browser-based, hands-on tools with zero setup. No backend, no install, no data leaves your machine.

**Live site:** `https://Tenilsridhar.github.io/container-lab/`
*(update this URL to match your repo name)*

---

## What's inside

| Tool | What it does |
|------|--------------|
| **Container Lab** (`container-lab.html`) | A 54-lesson, concept-by-concept Docker & Kubernetes course with a **simulated terminal** — you type real `docker` / `kubectl` / `helm` / cloud CLI commands and see authentic output. |
| **SRE Study Console** (`sre-interview-console.html`) | An "on-call ready" interview study console: study modules, drill flashcards, a mock SEV1, and a readiness gauge. |
| **Incident Management resources** | A playbook, an interview Q&A bank, a resume-defense guide, and a shareable one-page infographic (see downloads). |

The landing page (`index.html`) ties everything together.

---

## Container Lab — what it teaches

The lab is split into two clearly-labelled tracks, each divided into **Self-managed (on-prem)** and **Cloud (managed)**:

**Docker**
- Foundations: what a container is, Docker architecture, install & verify
- Images, layers & tags; the container lifecycle; exec, inspect & monitor
- Configuration & data: environment variables, volumes, networking
- Building images: Dockerfile deep dive, multi-stage builds, healthchecks & limits
- Multi-container apps with Compose; cleanup & disk management
- Cloud: registries & Docker Hub, managed services (Fargate / Cloud Run / ACI), managed registries (ECR / ACR / GAR)

**Kubernetes**
- Foundations: why K8s, control-plane + node architecture, cluster options
- Workloads: Pods, Deployments/ReplicaSets, labels & selectors, namespaces
- Networking: Services (ClusterIP / NodePort / LoadBalancer), Ingress
- Config & storage: ConfigMaps, Secrets, Volumes / PV / PVC / StorageClass
- Reliability: scaling, HPA autoscaling, probes, resource limits, self-healing, rollouts & rollbacks
- Advanced: YAML manifests, StatefulSet / DaemonSet / Job / CronJob, debugging, Helm, RBAC & network policies
- Cloud: managed vs self-managed, creating EKS/AKS/GKE clusters, cloud LoadBalancer external IPs, node pools & autoscaling, cloud IAM

**Extras**
- An **official-docs link on every lesson** (docker.io / kubernetes.io / cloud provider docs) for when you get stuck.
- A **"real-world issues & fixes"** panel per lesson (port conflicts, `CrashLoopBackOff`, `ImagePullBackOff`, `OOMKilled`, and more).
- Two hands-on **troubleshooting challenges** where you break something on purpose and fix it.

---

## Run it locally

No build step. Just open `index.html` in any modern browser, or serve the folder:

```bash
# Python 3
python3 -m http.server 8000
# then visit http://localhost:8000
```

---

## Deploy to GitHub Pages

1. Create a **public** repository on GitHub (e.g. `container-lab`).
2. Push these files to it (see `push.sh`, or the manual commands below).
3. In the repo: **Settings → Pages → Build and deployment**, set **Source = Deploy from a branch**, **Branch = `main`**, folder = **`/ (root)`**, and **Save**.
4. Wait ~1 minute — your site goes live at `https://<username>.github.io/<repo>/`.

Manual push (first time):

```bash
git init
git add .
git commit -m "Add SRE/DevOps learning hub"
git branch -M main
git remote add origin https://github.com/<username>/<repo>.git
git push -u origin main
```

> The empty **`.nojekyll`** file in this repo tells GitHub Pages to serve the files as-is (skipping Jekyll processing). Keep it.

---

## Repository structure

```
.
├── index.html                        # Landing page (links to everything)
├── container-lab.html                # Docker & Kubernetes hands-on lab
├── sre-interview-console.html        # SRE interview study console
├── Incident-Management-Playbook.docx # Incident-management deep dive
├── SRE-Interview-Prep.docx           # Interview Q&A bank
├── Resume-Interview-Prep.docx        # Resume-defense guide
├── Incident-Management-Pamphlet.png  # One-page infographic
├── README.md
├── push.sh                           # One-command push helper
└── .nojekyll                         # Serve static files as-is
```

---

## How it's built

- Plain **HTML, CSS, and vanilla JavaScript** — no frameworks, no dependencies, no build tooling.
- The lab's terminal is a **client-side simulator**: it maintains realistic in-memory state (containers, images, pods, deployments, services, volumes, namespaces, cloud clusters) and produces authentic command output. Nothing actually runs Docker or Kubernetes, so it's completely safe.
- Everything runs in the browser; **no server, no network calls, no tracking.**

## Notes & limitations

- The lab's interactive terminal is desktop-width; on small screens the lessons are still fully readable, but typing is best on a wider window.
- Progress isn't saved between reloads (browser storage isn't used).

## License

MIT — free to use, learn from, and adapt.

## Author

Built by **Tenil Sridhar**.
