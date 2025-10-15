### Fundamentals

## 1. What is the difference b/w a container and a pod, and why did we need pod when we already had container?
A container packages and runs a single process with its dependencies, while a pod is the smallest deployable unit in Kubernetes that can contain one or more tightly coupled containers.
We need pods because containers often need to work together (e.g., app + helper), share resources like network and storage, and be managed as a single unit. Pods simplify networking, enable sidecar patterns, and act as the atomic scheduling unit in Kubernetes — something that plain containers cannot provide.

**Example:**

_In logging_: App container + Fluentd sidecar in the same pod.

_In service mesh_: Envoy proxy injected as a sidecar container in the same pod.

---

## 2. What is difference between VM and container and Why did we need Containers when we already had VMs?
A VM virtualizes hardware and runs a full OS per instance, while a container virtualizes only the OS user space and shares the host kernel.
Containers are needed because they are lightweight, portable, faster to start, and more resource-efficient than VMs. This makes them ideal for microservices, DevOps pipelines, and cloud-native applications, whereas VMs are better when strong isolation or running different OS types is required.

**Example:**

A single physical server might run 10 VMs, but it can run hundreds of containers.

In Kubernetes/OpenShift, containers make scaling to thousands of microservices feasible, something not practical with VMs.

---

## 3. What is difference between kubernetes and openshift ? Why did we need openshift when we had already kubernetes?
Kubernetes is the open-source container orchestration platform that provides the core building blocks like scheduling, scaling, and networking.
OpenShift is Red Hat’s enterprise Kubernetes distribution that adds security hardening, developer tooling, integrated CI/CD, built-in registry, web console, and enterprise support.
We need OpenShift because while Kubernetes is powerful, it’s complex and not production-ready out-of-the-box. OpenShift provides a secure, integrated, and supported platform that enterprises can adopt directly instead of stitching together multiple tools around vanilla Kubernetes.

**Example:**

With Kubernetes, you’d need to set up Jenkins/ArgoCD for CI/CD, Harbor/Quay for registry, Prometheus/Grafana for monitoring, and secure it yourself.

With OpenShift, all of this comes pre-integrated and supported by Red Hat, reducing time-to-production.

---

## 4. what is the difference b/w namespaces and project? why did we need project when we had already namespaces?

A Namespace in Kubernetes is a logical resource isolation boundary, whereas an OpenShift Project is a higher-level abstraction built on top of a namespace.
Each project maps to a namespace but adds default security policies, RBAC roles, quotas, and network configurations, making it easier for teams to work securely and independently.
We need Projects because while namespaces provide isolation, they lack automation, governance, and developer-friendly features — which OpenShift provides out-of-the-box for enterprise environments.

**Example:**

A Kubernetes namespace is like **an empty room** — you need to bring your own furniture, locks, and rules.

An OpenShift project is like a **furnished office** — it already comes with access controls, quotas, and policies ready to use

---

## 5. Deployment vs StatefulSet vs DaemonSet — When to Use Each
Use Deployment for stateless apps — scale easily, no unique identity.

Use StatefulSet for stateful apps — each Pod has a stable name, storage, and identity.

Use DaemonSet for node-level apps — ensures one Pod per node for monitoring or system tasks.




| **Feature**      | **Deployment**                                  | **StatefulSet**                                      | **DaemonSet**                                       |
| ---------------- | ----------------------------------------------- | ---------------------------------------------------- | --------------------------------------------------- |
| **Purpose**      | Run stateless applications                      | Run stateful applications                            | Run one Pod per node                                |
| **Pod Identity** | Pods are identical and replaceable              | Pods have stable identities (name, network, storage) | Pod identity tied to node                           |
| **Pod Naming**   | Randomly generated names (e.g., `nginx-abc123`) | Predictable names (e.g., `db-0`, `db-1`, `db-2`)     | Pod name usually tied to node                       |
| **Storage**      | Uses ephemeral or shared storage                | Uses PersistentVolumeClaims (PVCs)                   | Usually ephemeral or host-based                     |
| **Scaling**      | Easy horizontal scaling                         | Ordered, controlled scaling (one at a time)          | Automatically runs on all or selected nodes         |
| **Use Case**     | Web apps, microservices, API servers            | Databases, message queues                            | Node-level agents, log collectors, monitoring tools |

---

### Conceptual Comparisons

Container vs Pod → Why pod abstraction is needed.

VM vs Container → Why containers are lighter, faster, and better for microservices.

Kubernetes vs OpenShift → Why OpenShift on top of Kubernetes.

ReplicaSet vs ReplicationController → Differences and usage.

Ingress vs OpenShift Route → Why OpenShift uses Routes instead of just Ingress.

ConfigMap vs Secret → When to use each, why Secrets need base64 encoding.

Horizontal Pod Autoscaler (HPA) vs Vertical Pod Autoscaler (VPA) → When to use scaling horizontally vs vertically.

PersistentVolume (PV) vs PersistentVolumeClaim (PVC) → How they connect applications to storage.

Docker vs CRI-O vs Containerd → Why OpenShift dropped Docker runtime.


### Kubernetes Core Components

Explain kube-apiserver, etcd, kube-scheduler, kube-controller-manager, kubelet, kube-proxy.

Why is etcd critical? What happens if etcd goes down?

How does kube-scheduler decide where to place a pod?

What’s the role of kubelet and how do you troubleshoot node issues with it?


### OpenShift-Specific

What are Security Context Constraints (SCCs) and how do they differ from Kubernetes PodSecurityPolicies?

How does authentication/authorization differ in OpenShift vs Kubernetes (OAuth, RBAC)?

Explain Source-to-Image (S2I) builds. Why does OpenShift provide this feature?

What are Operators in OpenShift? How do they simplify application and infrastructure management?

What’s the difference between OpenShift Routes and Kubernetes Ingress?

What are MachineSets and MachineConfigPools in OpenShift?

### Real-Time / Scenario-Based

Pod stuck in ContainerCreating → How would you troubleshoot? (events, describe, logs, check CNI, storage).

Pod stuck in Pending → What could be the reasons? (no resources, PVC not bound, node selectors, taints/tolerations).

Node NotReady → How to investigate? (kubelet logs, network issues, storage issues, etc).

High etcd latency → How to troubleshoot? (disk I/O, defragmentation, quorum).

ImagePullBackOff error → Causes and fixes (registry auth, DNS, image not found).

How do you handle OpenShift cluster upgrade? (steps, precautions, testing).

How do you monitor cluster health? (oc get clusterversion, Prometheus/Grafana, must-gather).

How do you secure workloads? (RBAC, SCCs, NetworkPolicies, TLS, image scanning).

### Advanced / DevOps & GitOps

Explain ArgoCD and why GitOps is useful in OpenShift.

How does RHACM (Red Hat Advanced Cluster Management) help in multi-cluster environments?

What is Hypershift in OpenShift? Why is it important?

How do you integrate CI/CD pipelines in OpenShift (Tekton, Jenkins, ArgoCD)?

How does OpenShift Service Mesh (Istio) work and why is it useful?

### Tricky/Why Questions (Interviewers love these!)

Why is a Pod the smallest deployable unit, not a container?

Why does OpenShift enforce non-root containers by default?

Why did OpenShift move from Docker to CRI-O?

Why do we need Operators when we already had Helm charts?

Why do we need Ingress Controllers when we can just expose NodePorts?

Why do we need StatefulSets when Deployments can scale too?

Why do we need etcd backup even if workloads are running fine?

## Core Architecture & Design

Why is a Pod the smallest deployable unit, not a container?

Why does Kubernetes use etcd instead of a SQL or NoSQL database?

Why is etcd backup important even if workloads are running fine?

Why did Kubernetes choose a declarative model (YAML manifests) over an imperative model?

Why are control plane components separated (API Server, Controller Manager, Scheduler) instead of a monolithic design?

Why does Kubernetes need a kube-proxy when Pods can talk directly using the CNI?

Why does kubelet not manage Pods created outside of Kubernetes (e.g., using docker run)?

Why are Pods ephemeral and not designed for data persistence?

Why does Kubernetes use labels and selectors instead of static IPs or hostnames?

Why are Namespaces used for multi-tenancy and resource isolation?

## 🛠️ Containers, Runtime & Scheduling

Why did OpenShift move from Docker to CRI-O?

Why is it recommended to run containers as non-root in OpenShift?

Why does Kubernetes schedule Pods at the node level, not per container?

Why does Kubernetes use taints and tolerations instead of static node assignment?

Why does the kube-scheduler not immediately reschedule a Pod when a node goes NotReady?

Why do we use requests and limits in resource configuration?

Why does overcommitting CPU not affect Pods as severely as overcommitting memory?

Why does Kubernetes not directly manage persistent storage but instead use the CSI (Container Storage Interface) model?

Why are Init Containers needed when we can put all logic in the main container?

Why does Kubernetes not store container images, but rely on external registries?

## 🔐 Security & Networking

Why does OpenShift enforce Security Context Constraints (SCCs) by default?

Why does OpenShift disable privileged containers for most users?

Why do Pods share a single network namespace inside the same Pod?

Why do we need NetworkPolicies when Kubernetes already isolates namespaces logically?

Why does Kubernetes not encrypt traffic between Pods by default?

Why does OpenShift use Routes instead of standard Ingress for application exposure?

Why is service-to-service communication not handled by DNS directly, but through Services?

Why do we need ClusterIP when external access can be done through NodePort?

Why do we use service accounts instead of running Pods as default credentials?

Why does Kubernetes separate RBAC for users and service accounts?

## ⚙️ Operations, Scaling & Upgrades

Why do we need Deployments instead of just creating Pods manually?

Why is Horizontal Pod Autoscaling based on CPU/memory by default?

Why does Kubernetes use rolling updates instead of recreating all Pods at once?

Why are control plane upgrades done before worker nodes?

Why do we need MachineConfigPools in OpenShift to manage OS-level updates?

Why does Kubernetes prefer desired state reconciliation over manual control loops?

Why do we use Operators when we already have Helm charts?

Why do we need CustomResourceDefinitions (CRDs) instead of extending Kubernetes source code?

Why is ArgoCD (GitOps) preferred over manual YAML deployments?

Why is OpenShift considered more secure and enterprise-ready than vanilla Kubernetes?


### Questions asked in NTT DATA

1. Can you explain the architecture of Red Hat OpenShift and its key components?



2. How would you deploy an application in OpenShift cluster. What are the resources you would require?



3. What are the key differences between OpenShift versions 4.14 and 4.18 in terms of features and enhancements?



4. What are the differences between ACM and ACS?

5. How do you validate vulnerabilities?


6. You created a Deployment and the YAML configuration appears correct, but the Pod status remains at 0/0. What could be the reasons, and how would you resolve it?

7. If a Pod is stuck in a CrashLoopBackOff state, what steps would you take to troubleshoot and fix the issue?

8. If a Pod is in an ImagePullBackOff or ErrImagePull state, how would you diagnose and resolve the problem?

9. During a firmware upgrade, if the iLO console becomes inaccessible, how would you proceed with troubleshooting?

10. How do you set up and configure Grafana and Prometheus for monitoring in OpenShift cluster?

11. What are Operators in OpenShift, and why are they used? How many operators you have used in your projects? such as service Mesh, Tekton, etc

12. You have multiple pod (A, B, C, and D), and you want all external route traffic to always flow through only pod A. How would you configure OpenShift to achieve this?

13. You have three OpenShift projects — Project X, Project Y, and Project Z. How can you enable secure communication between these projects?

14. There is one application to log into each cluster to collect node counts and store them in a database. You have 10 OpenShift clusters. The script works for 9 clusters but fails with a 403 Forbidden error on the 10th cluster, even though manual login works. What could be the cause, and how would you resolve it?


---
If Pod is in Container Creating state, what does this mean?

ACS 

OpenShift advantages

ACM purpose

OpenShift Pipeline

We have three worker nodes. If one is not ready, how do you troubleshoot

How to do an OpenShift Cluster Upgrade

Egress and ingress

Cordon and UnSchedulable 

Which pod should be removed from the node if it is not ready(Limit and tolerances)

SCC and RBAC

If PVC is pending state,  how would you t-shoot




