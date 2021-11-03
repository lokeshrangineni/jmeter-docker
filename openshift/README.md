

**Step1:** 

Update the [Jmeter ConfigMap](open-shift-jmeter-config-map.yml) as per your requirement. Create the Openshift `ConfigMap` which will be referred by the pod in later steps. 

```shell
oc apply -f open-shift-jmeter-config-map.yml
```

**Step2:**

Create the pod using the [Pod Definition](open-shift-kogito-jmeter-benchmark-pod.yml). This pod will automatically trigger the jmeter benchmarking based on the `ConfigMap` configuration.