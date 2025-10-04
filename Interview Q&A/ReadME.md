### Fundamentals

## 1. What is the difference b/w a container and a pod, and why did we need pod when we already had container?
A container packages and runs a single process with its dependencies, while a pod is the smallest deployable unit in Kubernetes that can contain one or more tightly coupled containers.
We need pods because containers often need to work together (e.g., app + helper), share resources like network and storage, and be managed as a single unit. Pods simplify networking, enable sidecar patterns, and act as the atomic scheduling unit in Kubernetes — something that plain containers cannot provide.

**Example:**

_In logging_: App container + Fluentd sidecar in the same pod.

_In service mesh_: Envoy proxy injected as a sidecar container in the same pod.


## 2. What is difference between vm and container and Why did we need Containers when we already had VMs?
A VM virtualizes hardware and runs a full OS per instance, while a container virtualizes only the OS user space and shares the host kernel.
Containers are needed because they are lightweight, portable, faster to start, and more resource-efficient than VMs. This makes them ideal for microservices, DevOps pipelines, and cloud-native applications, whereas VMs are better when strong isolation or running different OS types is required.

**Example:**

A single physical server might run 10 VMs, but it can run hundreds of containers.

In Kubernetes/OpenShift, containers make scaling to thousands of microservices feasible, something not practical with VMs.


## 3. What is difference between kubernetes and openshift ? Why did we need openshift when we had already kubernetes?
Kubernetes is the open-source container orchestration platform that provides the core building blocks like scheduling, scaling, and networking.
OpenShift is Red Hat’s enterprise Kubernetes distribution that adds security hardening, developer tooling, integrated CI/CD, built-in registry, web console, and enterprise support.
We need OpenShift because while Kubernetes is powerful, it’s complex and not production-ready out-of-the-box. OpenShift provides a secure, integrated, and supported platform that enterprises can adopt directly instead of stitching together multiple tools around vanilla Kubernetes.

**Example:**

With Kubernetes, you’d need to set up Jenkins/ArgoCD for CI/CD, Harbor/Quay for registry, Prometheus/Grafana for monitoring, and secure it yourself.

With OpenShift, all of this comes pre-integrated and supported by Red Hat, reducing time-to-production.



