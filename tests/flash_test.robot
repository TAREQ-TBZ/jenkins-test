*** Settings ***
Library           Process

*** Variables ***
${BOOTLOADER_FILE}           ./image/emmc_all imx-boot-scu-sd.bin-flash_singleboot
${IMAGE_FILE}                ./image/itx-image-devel-scu.rootfs-20250403084649.wic.zst
${UUU_COMMAND}               uuu -b emmc_all ${BOOTLOADER_FILE} ${IMAGE_FILE}
${FLASH_TIMEOUT}             600
${EXPECTED_PROMPT}           scu login:

*** Test Cases ***
Test Framework Is Working
    [Documentation]    Simple test to verify Robot Framework setup.
    Log    Robot Framework is working correctly!
    Should Be Equal    ${1}    ${1}    Numbers are not equal!
    Should Not Be Equal    ${1}    ${2}    Numbers are unexpectedly equal!
    Should Be True    ${True}    Value is not True!
    Should Be False    ${False}    Value is not False!

# Flash Image to Device
#     [Documentation]    Uses uuu tool to flash device with provided image.
#     ${result}=    Run Process    ${UUU_COMMAND}    shell=True    timeout=${FLASH_TIMEOUT}
#     Should Contain    ${result}    Success 1
#     Should Be Equal As Integers    ${result.rc}    0    Flashing failed with error: ${result.stderr}

