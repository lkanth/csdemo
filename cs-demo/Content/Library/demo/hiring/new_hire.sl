########################################################################################################################
#!!
#! @description: Generated flow description.
#!
#! @input first_name: Generated description.
#! @input middle_name: Generated description.
#! @input last_name: Generated description.
#! @input attempt: Generated description.
#!
#! @result FAILURE: Failure occurred during execution.
#! @result SUCCESS: Operation completed successfully.
#!!#
########################################################################################################################

namespace: demo.hiring
imports:
  base: demo.base
flow:
  name: new_hire
  inputs:
    - first_name: John
    - middle_name:
        required: false
    - last_name: Doe
    - attempt: '1'
  workflow:
    - print_start:
        do:
          base.print:
            - text: Starting new hire process
        navigate:
          - SUCCESS: create_email_address
    - create_email_address:
        do:
          create_user_email:
            - first_name
            - middle_name
            - last_name
            - attempt
        publish:
          - address
          - password
        navigate:
          - CREATED: print_finish
          - UNAVAILABLE: print_fail
          - FAILURE: print_fail
    - print_finish:
        do:
          base.print:
            - text: "${'Created address: ' + address + ' for: ' + first_name + ' ' + last_name}"
        navigate:
          - SUCCESS: SUCCESS
    - print_fail:
        do:
          base.print:
            - text: "${'Failed to create address for: ' + first_name + ' ' + last_name}"
        navigate:
          - SUCCESS: FAILURE
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      print_start:
        x: 100
        y: 250
      create_email_address:
        x: 400
        y: 250
      print_finish:
        x: 700
        y: 125
        navigate:
          0643b610-83e3-8fc9-bfcd-9b2c8c5486f0:
            targetId: f89b8d49-fa31-01db-61b8-c9d380379e98
            port: SUCCESS
      print_fail:
        x: 700
        y: 375
        navigate:
          b7842c9f-c5f2-2626-f9a8-560efc1e05b6:
            targetId: 6e0ab527-398e-a853-12a5-aaa5c086552c
            port: SUCCESS
    results:
      SUCCESS:
        f89b8d49-fa31-01db-61b8-c9d380379e98:
          x: 1000
          y: 125
      FAILURE:
        6e0ab527-398e-a853-12a5-aaa5c086552c:
          x: 1000
          y: 375
