########################################################################################################################
#!!
#! @description: Generated flow description.
#!
#! @input first_name: Generated description.
#! @input middle_name: Generated description.
#! @input last_name: Generated description.
#! @input attempt: Generated description.
#!
#! @output address: Generated description.
#! @output password: Generated description.
#! @output availability: Generated description.
#!
#! @result CREATED: Flow completed successfully.
#! @result UNAVAILABLE: Flow completed successfully.
#! @result FAILURE: Failure occurred during execution.
#!!#
########################################################################################################################

namespace: demo.hiring

flow:
  name: create_user_email

  inputs:
    - first_name
    - middle_name:
        required: false
    - last_name
    - attempt

  workflow:
    - generate_address:
        do:
          generate_user_email:
            - first_name
            - middle_name
            - last_name
            - attempt
        publish:
          - address: ${email_address}
        navigate:
          - SUCCESS: check_address
          - FAILURE: FAILURE

    - check_address:
        do:
          check_availability:
            - address
        publish:
          - availability: ${available}
          - password
        navigate:
          - UNAVAILABLE: UNAVAILABLE
          - AVAILABLE: CREATED

  outputs:
    - address
    - password
    - availability

  results:
    - CREATED
    - UNAVAILABLE
    - FAILURE