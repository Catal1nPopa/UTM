from tkinter import *
from math import *

#Function enables button clicks
def btnClick(numbers):
   global operator
   operator=operator+str(numbers)
   text_input.set(operator)

#Function enables 'C' button to clear display
def btnClearDisplay():
   global operator
   operator=""
   text_input.set("")

#Function enables completion of calculations
def btnEqualsInput():
   global operator
   sumof=str(eval(operator))
   text_input.set(sumof)
   operator=""

#Function enables square root calculations
def btnSquareRoot():
   global operator
   sqrt=math.sqrt()
   text_input.set("")
   operator=""


cal = Tk()
cal.title("Calculator")
operator=""
text_input=StringVar()

#Decides size, colour, etc. of display and font
txtdisplay=Entry(cal,font=('arial',20,'bold'),textvariable=text_input,bd=30,
                insertwidth=4,bg="powder blue",justify='right').grid(columnspan=3)

#Clear Button
btnClear=Button(cal,padx=10,bd=8,fg="black",font=('arial',20,'bold'),
               text="C",bg="Honeydew3",command=btnClearDisplay).grid(row=0,column=3)

#Top line
btnPi=Button(cal,padx=13,bd=8,fg="black",font=('arial',20,'bold'), #Pi button was too big when padx=16
               text="π",bg="Honeydew3",command=lambda:btnClick("3.1415")).grid(row=1,column=0), #Lambda command produces requested symbol/number in display when corresponding button is clicked

btnSquareRoot=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
               text="√",bg="Honeydew3",command=lambda:btnClick("sqrt")) .grid(row=1,column=1)

btnPercentage=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
               text="%",bg="Honeydew3",command=lambda:btnClick("/100*")).grid(row=1,column=2)

btnDivision=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
               text="/",bg="Honeydew3",command=lambda:btnClick("/")).grid(row=1,column=3)

#2nd line
btn7=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="7",command=lambda:btnClick(7)).grid(row=2,column=0)

btn8=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="8",command=lambda:btnClick(8)).grid(row=2,column=1)

btn9=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="9",command=lambda:btnClick(9)).grid(row=2,column=2)

btnMultiplication=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
               text="*",bg="Honeydew3",command=lambda:btnClick("*")).grid(row=2,column=3)

#3rd line
btn4=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="4",command=lambda:btnClick(4)).grid(row=3,column=0)

btn5=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="5",command=lambda:btnClick(5)).grid(row=3,column=1)

btn6=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="6",command=lambda:btnClick(6)).grid(row=3,column=2)

btnSubtraction=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
               text="-",bg="Honeydew3",command=lambda:btnClick("-")).grid(row=3,column=3)

#4th line
btn1=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="1",command=lambda:btnClick(1)).grid(row=4,column=0)

btn2=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="2",command=lambda:btnClick(2)).grid(row=4,column=1)

btn3=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="3",command=lambda:btnClick(3)).grid(row=4,column=2)

btnAddition=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
               text="+",bg="Honeydew3",command=lambda:btnClick("+")).grid(row=4,column=3)

#Bottom line
btnDot=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
               text=".",bg="Honeydew3",command=lambda:btnClick(".")).grid(row=5,column=0)

btn0=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
           text="0",command=lambda:btnClick(0)).grid(row=5,column=1)

#btnPlusMinus=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
#                text="+/-",bg="Honeydew3").grid(row=5,column=2)
btnBrackets=Button(cal,padx=16,bd=8,fg="black",font=('arial',20,'bold'),
               text="()",bg="Honeydew3").grid(row=5,column=2)

btnEquals=Button(cal,padx=16, bd=8,fg="black",font=('arial',20,'bold'),
               text="=",bg="tomato",command=btnEqualsInput).grid(row=5,column=3)


#Causes calculator to stay open
cal.mainloop()
