########################################################################################################################
#!!
#! @description: Generated flow description.
#!
#! @input first_name: Generated description.
#! @input middle_name: Generated description.
#! @input last_name: Generated description.
#! @input attempt: Generated description.
#!
#! @result SUCCESS: Operation completed successfully.
#! @result FAILURE: Failure occurred during execution.
#!
#!!#
########################################################################################################################

namespace: demo.hiring

imports:
  base: demo.base

flow:
  name: new_hire

  inputs:
    - first_name
    - middle_name:
        required: false
    - last_name
    - attempt

  workflow:
    - print_start:
        do:
          base.print:
            - text: "Starting new hire process"
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
          - FAILURE: FAILURE

  results:
    - FAILURE
    - SUCCESS