########################################################################################################################
#!!
#! @description: Generated Python operation description.
#!
#! @input first_name: Generated description
#! @input middle_name: Generated description
#! @input last_name: Generated description
#! @input domain: Generated description
#! @input attempt: Generated description
#!
#! @output email_address: Generated description
#!
#! @result SUCCESS: Operation completed successfully.
#! @result FAILURE: Failure occurred during execution.
#!!#
########################################################################################################################

namespace: demo.hiring

operation:
  name: generate_user_email

  inputs:
    - first_name
    - middle_name:
        required: false
        default: ""
    - last_name
    - domain:
        default: "acompany.com"
        private: true
    - attempt

  python_action:
    script: |
      attempt = int(attempt)
      if attempt == 1:
        address = first_name[0:1] + '.' + last_name + '@' + domain
      elif attempt == 2:
        address = first_name + '.' + first_name[0:1] + '@' + domain
      elif attempt == 3 and middle_name != '':
        address = first_name + '.' + middle_name[0:1] + '.' + last_name + '@' + domain
      else:
        address = ''
      # print address

  outputs:
    - email_address: ${address}

  results:
    - FAILURE: ${address == ''}
    - SUCCESS