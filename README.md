# nscout

`nscout` packages some useful network tools to scout network in k8s clusters

## Deploy

Run the following command

```
./nscout.sh {your-node-selector-label}
```

Then the `nscout` pod will be deployed in the `default` namespace on your selected node.

```
kubectl -n default get pods nscout

NAME     READY   STATUS    RESTARTS   AGE
nscout   1/1     Running   0          3h9m
```

You can delete this pod by

```
kubectl -n default delete pods nscout
```

## Tools

- `curl`
- `dig`
- `nslookup`
- `host`
- `nc`
- `nmap`
- `tcpdump`

## Examples

### Use `nc` to detect whether one UDP port is opened between two clusters

In one cluster to start an UDP server

```
kubectl -n default exec -it nscout -- /bin/bash
nc -v -u -l {your UDP port}
```

In other cluster to detect the connection

```
kubectl -n default exec -it nscout -- /bin/bash
nc -vz -w 10 -u {The first cluster IP} {The first cluster UDP port}
```
