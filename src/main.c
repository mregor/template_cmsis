#include "stm32f1xx.h"
#include "main.h"

void main(void)
{
    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN; //Включаем порт C
    GPIOC->CRH |= GPIO_CRH_MODE13_0;
    while (1){
        GPIOC->BSRR |= GPIO_BSRR_BS13;
        delay(100);
        GPIOC->BSRR |= GPIO_BSRR_BR13;
        delay(100); 
    }
}

void delay(uint32_t msec)
{
    for (uint32_t j=0; j<2000UL*msec; j++)
    {
        __NOP();
    }
}
