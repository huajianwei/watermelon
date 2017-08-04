//
//  ViewController.m
//  enotest
//
//  Created by adam on 2017/7/18.
//  Copyright © 2017年 adam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *chuZaTF;//除杂
@property (weak, nonatomic) IBOutlet UITextField *maoZhongTF;
@property (weak, nonatomic) IBOutlet UITextField *piZhongTF;
@property (weak, nonatomic) IBOutlet UITextField *jingZhongTF;
@property (weak, nonatomic) IBOutlet UITextField *ChuZaJingZhongTF;
@property (weak, nonatomic) IBOutlet UITextField *danJianTF;
@property (weak, nonatomic) IBOutlet UITextField *ResultTF;
@property (weak, nonatomic) IBOutlet UIButton *jiSuanBT;
@property (weak, nonatomic) IBOutlet UIButton *qiChuBT;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    self.chuZa =3;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];

    [self.jiSuanBT addTarget:self action:@selector(jiSuan) forControlEvents:UIControlEventTouchUpInside];
    [self.qiChuBT addTarget:self action:@selector(qiChu) forControlEvents:UIControlEventTouchUpInside];


    self.chuZaTF.keyboardType =UIKeyboardTypeDecimalPad;
    self.ChuZaJingZhongTF.keyboardType = UIKeyboardTypeDecimalPad;
    self.piZhongTF.keyboardType = UIKeyboardTypeDecimalPad;
    self.maoZhongTF.keyboardType = UIKeyboardTypeDecimalPad;
    self.danJianTF.keyboardType = UIKeyboardTypeDecimalPad;


    self.jingZhongTF.userInteractionEnabled = NO;
    self.ChuZaJingZhongTF.userInteractionEnabled = NO;
    self.ResultTF.userInteractionEnabled = NO;
}
- (void)jiSuan{
    self.result = self.chuZaJingZhong*self.danJia*2;
    self.ResultTF.text = [NSString stringWithFormat:@"%.3f",self.result];
}

- (void)qiChu{

    self.maoZhong=0;
    self.piZhong = 0;
    self.danJia  =0;
    self.jingZhong=0;
    self.chuZaJingZhong=0;

    self.maoZhongTF.text =0;
    self.piZhongTF.text  =0;
    self.jingZhongTF.text =0;
    self.danJianTF.text =0;
    self.ChuZaJingZhongTF.text =0;

    self.ResultTF.text=0;
    self.result =0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setChuZa:(NSInteger)chuZa{
    _chuZa = chuZa;
    self.chuZaTF.text = [NSString stringWithFormat:@"%ld",chuZa];
}
- (void)setJingZhong:(float)jingZhong{
    _jingZhong = jingZhong;
    self.jingZhongTF.text = [NSString stringWithFormat:@"%.2f",jingZhong];
}

- (void)setChuZaJingZhong:(float)chuZaJingZhong{
    _chuZaJingZhong = chuZaJingZhong;
    self.ChuZaJingZhongTF.text = [NSString stringWithFormat:@"%.2f",chuZaJingZhong];
}

- (void)setResult:(float)result{
    _result = result;
    self.ResultTF.text = [NSString stringWithFormat:@"%.3f",result];
}
- (void)setDanJia:(float)danJia{
    _danJia = danJia;
//    self.danJianTF.text = [NSString stringWithFormat:@"%.2f",danJia];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{

}


- (void)textFieldTextDidChange:(NSNotification*)info{
    UITextField *currentTextField = (UITextField *)info.object;
    if (currentTextField==self.chuZaTF) {//除杂
        self.chuZa = [currentTextField.text integerValue];
        self.chuZaJingZhong = self.jingZhong*(1-self.chuZa/100.0);

        [self performSelector:@selector(jiSuan)];
    }else if(currentTextField == self.maoZhongTF){//毛重
        self.maoZhong = [currentTextField.text floatValue];
        self.jingZhong = self.maoZhong-self.piZhong;
        self.chuZaJingZhong = self.jingZhong*(1-self.chuZa/100.0);

        [self performSelector:@selector(jiSuan)];


    }else if(currentTextField == self.piZhongTF){//皮重
        self.piZhong = [currentTextField.text floatValue];
        self.jingZhong = self.maoZhong-self.piZhong;
        self.chuZaJingZhong = self.jingZhong*(1-self.chuZa/100.0);

        [self performSelector:@selector(jiSuan)];


    }else if(currentTextField == self.jingZhongTF){//净重
        self.jingZhong = [currentTextField.text floatValue];
    }else if(currentTextField == self.ChuZaJingZhongTF){//除杂净重
        self.chuZaJingZhong = [currentTextField.text floatValue];
    }else if(currentTextField == self.danJianTF){//单价
        self.danJia = [currentTextField.text floatValue];

        [self performSelector:@selector(jiSuan)];
    }else{

    }
}

@end
