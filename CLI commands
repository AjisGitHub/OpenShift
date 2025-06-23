# 📘 OpenShift `oc` CLI Command Reference

A handy cheat sheet for OpenShift developers and administrators using the `oc` CLI.

---

## 📁 Project and Namespace Management
- `oc new-project <project-name>` – Create a new project.
- `oc project <project-name>` – Switch to a different project.
- `oc project` – View current project and accessible ones.
- `oc delete project <project-name>` – Delete a project.

---

## ⚙️ Resource Management
- `oc get all` – List all resources in the current namespace.
- `oc get <resource-type> <resource-name> -o yaml` – Get resource in YAML format.
- `oc apply -f <file.yaml>` – Apply resources from a file.
- `oc delete <resource-type> <resource-name>` – Delete a resource.
- `oc edit <resource-type> <resource-name>` – Edit a resource.

---

## 🧱 Pods
- `oc get pods` – List pods.
- `oc describe pod <pod-name>` – Detailed pod info.
- `oc logs <pod-name>` – View pod logs.
- `oc exec -it <pod-name> -- <command>` – Execute commands inside a pod.
- `oc annotate <resource-type> <resource-name> <annotation>` – Annotate resources.
- `oc label <resource-type> <resource-name> <label>` – Label resources.

---

## 📦 Deployments and ReplicaSets
- `oc create deployment <name> --image=<image>` – Create deployment.
- `oc get deployment <name>` – Get deployment details.
- `oc scale deployment <name> --replicas=<number>` – Scale replicas.
- `oc rollout status deployment/<name>` – Rollout status.
- `oc rollout undo deployment/<name>` – Rollback deployment.

---

## 🌐 Services
- `oc create service clusterip <name> --tcp=8080:80` – Create ClusterIP service.
- `oc get svc` – List services.
- `oc expose deployment <name> --type=ClusterIP --port=8080` – Expose deployment.

---

## 🗂 ConfigMaps and Secrets
- `oc create configmap <name> --from-literal=<key>=<value>` – Create ConfigMap.
- `oc create secret generic <name> --from-literal=<key>=<value>` – Create Secret.
- `oc set env deployment/<name> <key>=<value>` – Set env var in deployment.

---

## 💾 Persistent Storage
- `oc get pv` – List PersistentVolumes.
- `oc get pvc` – List PersistentVolumeClaims.
- `oc create -f <pvc-config>.yaml` – Create PVC from file.

---

## 🛣️ Networking
- `oc get network.config.openshift.io/cluster -o yaml` – View cluster network config.
- `oc patch network.config.openshift.io/cluster -p '<patch>' --type=merge` – Patch network config.

---

## 🖼️ Image Management
- `oc image info <image-name>` – View image details.
- `oc tag <image> <new-image>` – Tag image.
- `oc import-image <stream> --from=<image>` – Import image to stream.

---

## 🏗️ Build and Image Streams
- `oc new-build --strategy=Docker --name <name> <src>` – Create Docker build.
- `oc start-build <name>` – Trigger build.
- `oc import-image <stream> --from=<image>` – Import image (duplicate).

---

## 🔧 Builds and BuildConfigs
- `oc create bc <name> --binary --image-stream=python:3.6 --source-secret=mysecret` – Create binary build config.
- `oc start-build <name>` – Start build from config.

---

## 🔁 Rollouts
- `oc rollout status deployment/<name>` – Check rollout status.
- `oc rollout undo deployment/<name>` – Roll back deployment.

---

## 🧩 Troubleshooting
- `oc logs <pod-name>` – Get logs.
- `oc describe pod <pod-name>` – Detailed pod info.
- `oc get events` – View events.

---

## 🔐 RBAC (Role-Based Access Control)
- `oc create rolebinding <name> --role=admin --user=<username>` – Bind admin role to user.
- `oc get clusterrolebindings` – List cluster role bindings.

---

## 🛠️ Operator Management
- `oc get operators.operators.coreos.com` – List operators.
- `oc adm upgrade` – Trigger cluster upgrade.

---

## 🖥️ MachineSets and Machines
- `oc get machinesets` – List machine sets.
- `oc describe machineset <name>` – Machine set details.

---
