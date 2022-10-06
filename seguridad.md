# nonroot

template:
    metadata:
      labels:
        app: webhook-server
    spec:
      securityContext:
        runAsNonRoot: true
        runAsUser: 1234

# secrets


# admision controllers
apiVersion: admissionregistration.k8s.io/v1beta1
kind: MutatingWebhookConfiguration
metadata:
  name: demo-webhook
webhooks:
  - name: webhook-server.webhook-demo.svc
    clientConfig:
      service:
        name: webhook-server
        namespace: webhook-demo
        path: "/mutate"
      caBundle: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURQekNDQWllZ0F3SUJBZ0lVUS9MZDdVSnRiUEQ2cWYybFZTLzBhWkx1OUlJd0RRWUpLb1pJaHZjTkFRRUwKQlFBd0x6RXRNQ3NHQTFVRUF3d2tRV1J0YVhOemFXOXVJRU52Ym5SeWIyeHNaWElnVjJWaWFHOXZheUJFWlcxdgpJRU5CTUI0WERUSXlNRGd4TXpFMk1qTXdOMW9YRFRJeU1Ea3hNakUyTWpNd04xb3dMekV0TUNzR0ExVUVBd3drClFXUnRhWE56YVc5dUlFTnZiblJ5YjJ4c1pYSWdWMlZpYUc5dmF5QkVaVzF2SUVOQk1JSUJJakFOQmdrcWhraUcKOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQTJkbTYraFMvYm5TMWNEalkyQVRZZElEbkRWcXhzbDJkdFI1dAppa0pXdlc3WDRlOENDUjhTM1ZhbndLQVNzNmRId25sZ1VBaGdGTTV0aGZmd1hLSUxhMXdVNkJXMlBFdU9ndDlGCi91M3J1cDAxNFdGbHZPV2VZRWlWdFVKR0hscTZ3SmV3ZHl1Z2lDTkJPR3B6dVgvMzBWam5pYjl0S1g2VHVKZ3MKZ0FwVW1qWGVtcHFjTk40WXp3R3VzUVRFWkdNUnpOOFhLd3AraXpCMFByNnFyRFp0RG4zdGkxeXU1cXdpbkt3cApxNm9Nbnd5SnpCUTM3Rjg3SFRwK05QZWdweDY1RlZxSEV4SFJMNVMyUjhrRjBycFR1bTUvN2VNYzNBMTM3bE9TCmFWWWNKbHc5QTZVeTArR1JZYXB0d2Vxc3dZN2VRWCt2QzB1Uk9mRUV6T3FmMjFBV2t3SURBUUFCbzFNd1VUQWQKQmdOVkhRNEVGZ1FVRWFFZURZejF0d2VtbmlSUWc5SFNGRzVSdFNzd0h3WURWUjBqQkJnd0ZvQVVFYUVlRFl6MQp0d2VtbmlSUWc5SFNGRzVSdFNzd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBTkJna3Foa2lHOXcwQkFRc0ZBQU9DCkFRRUF6MVNaeVRwQndMTGJZMVI2VUhxWUtsYXVFYlRsY1JPZno5VlhiV202b1laaUxjU1JGK2IvV01JUTNHRkcKMHRHZStJeFl3QVRlc1VqeTVrL3o5b2l3NUwwcVhmT1RBcmVoZC9ndk9tR09HdTlzamJUaFhjbGpHQnE5SUFWaQpRcnlyWGNmdjViaWMzU2NpVVBJWGN3TGlYK0RYalFqK2thL3NyVVp1S005QXFzREExdGZETjhpUUhXL1lic0RnCk5oeWhaWUNmVGxSd0o2R0U0L1ZidVR1TzMxc2tvTk10NktLa2dUc3N0VDAwclhFQU94SWlqaFBEQ3FwQnIxZisKRnlSbm50VDNGNzhsb25mbGgvRUNwTklKTWpiUjM2ckttVm91QXJWS2lQRDZTd1JZeFZuNzdvTW1zSldTVHNSbgo0NmhNSURXNktZSlVsMG1oOU93T0dnQzNsQT09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    rules:
      - operations: [ "CREATE" ]
        apiGroups: [""]
        apiVersions: ["v1"]
        resources: ["pods"]

# Pod Security Policy
apiVersion: policy/v1beta1
kind: PodSecurityPolicy

# OPA open policy agent
https://www.youtube.com/watch?v=R6tUNpRpdnY
https://www.youtube.com/watch?v=4mBJSIhs2xQ


