
CURRENT_DIRECTORY = $(shell pwd)

KUBECONFIG_DIRECTORY = .kube
KUBECONFIG = $(CURRENT_DIRECTORY)/.kube/config

MINIKUBE_ENV_VARS = KUBECONFIG=$(KUBECONFIG) MINIKUBE_HOME=$(CURRENT_DIRECTORY)

minikube.bootstrap:
	mkdir -p $(KUBECONFIG_DIRECTORY)
	touch ${KUBECONFIG}
	$(MINIKUBE_ENV_VARS) minikube start --vm-driver=virtualbox

minikube.delete:
	$(MINIKUBE_ENV_VARS) minikube delete

minikube.tunnel:
	$(MINIKUBE_ENV_VARS) minikube tunnel

helm.init:
	helm init --kubeconfig=$(KUBECONFIG)

helm.list:
	helm list --kubeconfig=$(KUBECONFIG)

helm.install:
	helm --kubeconfig=$(KUBECONFIG) --kube-context=minikube install $(CURRENT_DIRECTORY)

kubectl.pod:
	kubectl --kubeconfig=$(KUBECONFIG) get --all-namespaces pod

kubectl.service:
	kubectl --kubeconfig=$(KUBECONFIG) get --all-namespaces service
