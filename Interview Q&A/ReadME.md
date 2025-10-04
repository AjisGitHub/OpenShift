### What is the difference b/w a container and a pod, and why did we need pod when we already had container?
A container packages and runs a single process with its dependencies, while a pod is the smallest deployable unit in Kubernetes that can contain one or more tightly coupled containers.
We need pods because containers often need to work together (e.g., app + helper), share resources like network and storage, and be managed as a single unit. Pods simplify networking, enable sidecar patterns, and act as the atomic scheduling unit in Kubernetes — something that plain containers cannot provide.
**Real-world example:**

_In logging_: App container + Fluentd sidecar in the same pod.

_In service mesh_: Envoy proxy injected as a sidecar container in the same pod.
