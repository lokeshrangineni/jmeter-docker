

**Step1:** 

Update the [Jmeter ConfigMap](open-shift-jmeter-config-map.yml) as per your requirement. Create the Openshift `ConfigMap` which will be referred by the pod in later steps. 

```shell
oc apply -f open-shift-jmeter-config-map.yml
```

**Step2:**

Create the pod using the [Pod Definition](open-shift-kogito-jmeter-benchmark-pod.yml). This pod will automatically trigger the jmeter benchmarking based on the `ConfigMap` configuration.


**Step3:**

Once the pod is created and done with the benchmarking use the `oc rsync` command to download the report files available in the pod's `/tmp/jmeter` folder.

```shell
oc rsync pod-kogito-jmeter-benchmark4:/tmp/jmeter ./test
```