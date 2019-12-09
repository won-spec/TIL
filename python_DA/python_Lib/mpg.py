class Car:
    
    def __init__(self,manufacturer,model,displ,year,cyl,trans,drv,cty,hwy,fl,cl):
        self.cManu = manufacturer
        self.cModel = model
        self.cDispl = float(displ)
        self.cYear = int(year)
        self.cCyl = cyl
        self.cTrans = trans
        self.cDrv = drv
        self.cCty = int(cty)
        self.cHwy = int(hwy)
        self.cFl = fl
        self.cCl = cl
        
    def test_print(self):
        print("테스트용 프린트 Hwy : {}".format(self.cHwy))
        