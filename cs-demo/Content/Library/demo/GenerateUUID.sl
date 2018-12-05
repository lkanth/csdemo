namespace: demo
flow:
  name: GenerateUUID
  workflow:
    - uuid:
        do:
          demo.uuid: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      uuid:
        x: 146.01388549804688
        y: 101.59373474121094
        navigate:
          522e3961-5761-a143-2842-12b2c576246a:
            targetId: 788039f6-664d-d0a5-7157-f69228eecf61
            port: SUCCESS
    results:
      SUCCESS:
        788039f6-664d-d0a5-7157-f69228eecf61:
          x: 426.0138854980469
          y: 83.05207824707031
