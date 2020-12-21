# CRUX enabled repo

This is a sample CRUX-enabled repo
In order to use it:
- copy folder .crux to you repository
- edit .crux/crux.yaml"
    - specify resources for CRUX and your tests:
        - Git service connections
        - Kubernetes Service connection (jmeter mode)
        - ARM Service connection (on_aks_created_for_each_test_run and on_aks_pool_created_for_each_test_run)
    - adjust paths and parameters 
