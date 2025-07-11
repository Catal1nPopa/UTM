from tkinter import *
expression = ""
def apasa(num):
    global expression
    expression = expression + str(num)
    equation.set(expression)

def equalpress():
    try:

        global expression
        total = str(eval(expression))
        equation.set(total)
        expression = ""
    except:

        equation.set(" error ")
        expression = ""

def minus_plus():
    expression = (-abs(expression))

def clear():
    global expression
    expression = ""
    equation.set("")

if __name__ == "__main__":
    gui = Tk()
    gui.configure(background="black")
    gui.title("UTM-Popa Catalin")
    gui.geometry("273x200")
    equation = StringVar()
    expression_field = Entry(gui, textvariable=equation)
    expression_field.grid(columnspan=4, ipadx=70)

    button1 = Button(gui, text=' 1 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(1), height=1, width=7)
    button1.grid(row=2, column=0)
    button2 = Button(gui, text=' 2 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(2), height=1, width=7)
    button2.grid(row=2, column=1)
    button3 = Button(gui, text=' 3 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(3), height=1, width=7)
    button3.grid(row=2, column=2)
    button4 = Button(gui, text=' 4 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(4), height=1, width=7)
    button4.grid(row=3, column=0)
    button5 = Button(gui, text=' 5 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(5), height=1, width=7)
    button5.grid(row=3, column=1)
    button6 = Button(gui, text=' 6 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(6), height=1, width=7)
    button6.grid(row=3, column=2)
    button7 = Button(gui, text=' 7 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(7), height=1, width=7)
    button7.grid(row=4, column=0)
    button8 = Button(gui, text=' 8 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(8), height=1, width=7)
    button8.grid(row=4, column=1)
    button9 = Button(gui, text=' 9 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(9), height=1, width=7)
    button9.grid(row=4, column=2)
    button0 = Button(gui, text=' 0 ', fg='black',bd =7, bg='green',
                    command=lambda: apasa(0), height=1, width=7)
    button0.grid(row=5, column=0)
    plus = Button(gui, text=' + ', fg='black',bd =7, bg='yellow',
                command=lambda: apasa("+"), height=1, width=7)
    plus.grid(row=2, column=3)
    minus = Button(gui, text=' - ', fg='black',bd =7, bg='yellow',
                command=lambda: apasa("-"), height=1, width=7)
    minus.grid(row=3, column=3)
    multiply = Button(gui, text=' * ', fg='black',bd =7, bg='yellow',
                    command=lambda: apasa("*"), height=1, width=7)
    multiply.grid(row=4, column=3)
    divide = Button(gui, text=' / ', fg='black',bd =7, bg='yellow',
                    command=lambda: apasa("/"), height=1, width=7)
    divide.grid(row=5, column=3)
    btnPercentage=Button(gui, text="%", fg='black',bd =7,bg="Honeydew3",
                    command=lambda: apasa("/100*"),height=1, width=7)
    btnPercentage.grid(row=5,column=2)
    btnpower=Button(gui, text="x^2", fg='black',bd =7,bg="Honeydew3",
               command=lambda: apasa("**2"),height=1, width=7)
    btnpower.grid(row=5,column=1)
    equal = Button(gui, text=' -/+ ', fg='black',bd =7, bg='yellow',
                command=minus_plus, height=1, width=7)
    equal.grid(row=6, column=3)
    equal = Button(gui, text=' = ', fg='black',bd =7, bg='blue',
                command=equalpress, height=1, width=7)
    equal.grid(row=6, column=2)
    clear = Button(gui, text='Clear', fg='black',bd =7, bg='red',
                command=clear, height=1, width=7)
    clear.grid(row=6, column='1')
    Decimal= Button(gui, text='.', fg='black',bd =7, bg='white',
                    command=lambda: apasa('.'), height=1, width=7)
    Decimal.grid(row=6, column=0)
    gui.mainloop()
