########################################################################################################################
#!!
#! @description: Generated Python operation description.
#!
#!
#! @output uuid: Generated description
#!
#! @result SUCCESS: Operation completed successfully.
#!!#
########################################################################################################################

namespace: demo

operation:
  name: uuid

  python_action:
    script: |
      import uuid
      uuid = str(uuid.uuid1())

  outputs:
    - uuid: ${uuid}

  results:
    - SUCCESS