%[X1]=MAIN('Database_Liver.txt');
%[X1]=MAIN('Breat.txt');

function [X1]=MAIN(Database)

clc;
Databasegoc = load(Database);
[a,b]=size(Databasegoc);
j=1;
t=1;
% for i=1:a
%     if Databasegoc(i,1)==2
%         Databasegoc(i,1)=0;
%     else
%         Databasegoc(i,1)=1;
%     end
% end
for i=1:a
    if Databasegoc(i,1)==0
        label2(j,:)=Databasegoc(i,:);
        j=j+1;
    else  
        label4(t,:)=Databasegoc(i,:);
        t=t+1;
    end
end
[a1,b1]=size(label2);
[a2,b2]=size(label4);
t1=1;t2=1;t3=1;t4=1;t5=1;t6=1;t7=1;t8=1;t9=1;
for i=1:a1
    if i< round(a1/10)+1
       fold21(i,:)=label2(i,:);
    else
        if i< round(2*a1/10)+1
            fold22(t1,:)=label2(i,:);
            t1=t1+1;
        else
            if i< round(3*a1/10)+1
                fold23(t2,:)=label2(i,:);
                t2=t2+1;
            else
                if i< round(4*a1/10)+1
                    fold24(t3,:)=label2(i,:);
                    t3=t3+1;
                else
                    if i< round(5*a1/10)+1
                        fold25(t4,:)=label2(i,:);
                        t4=t4+1;
                    else
                        if i< round(6*a1/10)+1
                            fold26(t5,:)=label2(i,:);
                            t5=t5+1;
                        else
                            if i< round(7*a1/10)+1
                                fold27(t6,:)=label2(i,:);
                                t6=t6+1;
                            else
                                if i< round(8*a1/10)+1
                                    fold28(t7,:)=label2(i,:);
                                    t7=t7+1;
                                else
                                    if i< round(9*a1/10)+1
                                        fold29(t8,:)=label2(i,:);
                                        t8=t8+1;
                                    else
                                        fold210(t9,:)=label2(i,:);
                                        t9=t9+1;
                                    end
                                end
                            end
                        end            
                    end 
                end
            end
        end
    end
end
t1=1;t2=1;t3=1;t4=1;t5=1;t6=1;t7=1;t8=1;t9=1;
for i=1:a2
    if i< round(a2/10)+1
       fold41(i,:)=label4(i,:);  
    else
        if i< round(2*a2/10)+1
           fold42(t1,:)=label4(i,:);
           t1=t1+1;
        else
            if i< round(3*a2/10)+1
               fold43(t2,:)=label4(i,:);
               t2=t2+1;
            else
                if i< round(4*a2/10)+1
                   fold44(t3,:)=label4(i,:);
                   t3=t3+1;
                else
                    if i< round(5*a2/10)+1
                       fold45(t4,:)=label4(i,:);
                       t4=t4+1;
                    else
                        if i< round(6*a2/10)+1
                           fold46(t5,:)=label4(i,:);
                      
                           t5=t5+1;
                        else
                            if i< round(7*a2/10)+1
                               fold47(t6,:)=label4(i,:);
                          
                               t6=t6+1;
                            else
                                if i< round(8*a2/10)+1
                                    fold48(t7,:)=label4(i,:);
                                  
                                    t7=t7+1;
                                else
                                    if i< round(9*a2/10)+1
                                        fold49(t8,:)=label4(i,:);
                                        
                                        t8=t8+1;
                                    else
                                        fold410(t9,:)=label4(i,:);
                                       
                                        t9=t9+1;
                                    end
                                end
                            end
                        end            
                    end 
                end
            end
        end
    end
end
fold21=[fold21;fold22];
[c1,d1]=size(fold21);
dem1=0;
dem2=0;
for i=1:c1
    if i<0.05*c1
        if i<0.05*0.7*c1
            RTrain2(i,:)=fold21(i,:); 
        else
            dem1=dem1+1;
            RVal2(dem1,:)=fold21(i,:);
        end
    else
        dem2=dem2+1;
        RTest2(dem2,:)=fold21(i,:); 
        
    end
end
dem1=0;
dem2=0;
fold41=[fold41;fold42];
[c2,d2]=size(fold41);
for i=1:c2
    if i<0.05*c2
        if i<0.05*0.7*c2
            RTrain4(i,:)=fold41(i,:); 
        else
            dem1=dem1+1;
            RVal4(dem1,:)=fold41(i,:);
        end
    else
        dem2=dem2+1;
        RTest4(dem2,:)=fold41(i,:);
    end
end
RTrain=[RTrain2;RTrain4];
RVal=[RVal2;RVal4];
RTest=[RTest2;RTest4];
[X1 A B cluster center_vector] = Rule1(RTrain);

[AccuracyRVal1 Time1] = TestGraph2(RVal,A,B,X1,cluster,center_vector)
[AccuracyRTest1 Time1] = TestGraph2(RTest,A,B,X1,cluster,center_vector)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [c1,d1]=size(fold22);
% dem1=0;
% dem2=0;
% for i=1:c1
%     if i<0.1*c1
%         if i<0.1*0.7*c1
%             RTrain2(i,:)=fold22(i,:); 
%         else
%             dem1=dem1+1;
%             RVal2(dem1,:)=fold22(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest2(dem2,:)=fold22(i,:); 
%         
%     end
% end
% dem1=0;
% dem2=0;
% [c2,d2]=size(fold42);
% for i=1:c2
%     if i<0.1*c2
%         if i<0.1*0.7*c2
%             RTrain4(i,:)=fold42(i,:); 
%         else
%             dem1=dem1+1;
%             RVal4(dem1,:)=fold42(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest4(dem2,:)=fold42(i,:);
%     end
% end
% RTrain=[RTrain2;RTrain4];
% RVal=[RVal2;RVal4];
% RTest=[RTest2;RTest4];
% size(RTrain)
% size(RVal)
% size(RTest)
% [X2 A B cluster center_vector] = Rule2(RTrain,X1);
% X1=X2;
% [AccuracyRVal2 Time2] = TestGraph2(RVal,A,B,X2,cluster,center_vector)
% [AccuracyRTest2 Time2] = TestGraph2(RTest,A,B,X2,cluster,center_vector)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fold23=[fold23;fold24];
[c1,d1]=size(fold23);
dem1=0;
dem2=0;
for i=1:c1
    if i<0.05*c1
        if i<0.05*0.7*c1
            RTrain2(i,:)=fold23(i,:); 
        else
            dem1=dem1+1;
            RVal2(dem1,:)=fold23(i,:);
        end
    else
        dem2=dem2+1;
        RTest2(dem2,:)=fold23(i,:); 
        
    end
end
dem1=0;
dem2=0;
fold43=[fold43;fold44];
[c2,d2]=size(fold43);
for i=1:c2
    if i<0.05*c2
        if i<0.05*0.7*c2
            RTrain4(i,:)=fold43(i,:); 
        else
            dem1=dem1+1;
            RVal4(dem1,:)=fold43(i,:);
        end
    else
        dem2=dem2+1;
        RTest4(dem2,:)=fold43(i,:);
    end
end
RTrain=[RTrain2;RTrain4];
RVal=[RVal2;RVal4];
RTest=[RTest2;RTest4];
[X2 A B cluster center_vector] = Rule2(RTrain,X1);
X1=X2;
[AccuracyRVal3 Time3] = TestGraph2(RVal,A,B,X1,cluster,center_vector)
[AccuracyRTest3 Time3] = TestGraph2(RTest,A,B,X1,cluster,center_vector)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [c1,d1]=size(fold24);
% dem1=0;
% dem2=0;
% for i=1:c1
%     if i<0.1*c1
%         if i<0.1*0.7*c1
%             RTrain2(i,:)=fold24(i,:); 
%         else
%             dem1=dem1+1;
%             RVal2(dem1,:)=fold24(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest2(dem2,:)=fold24(i,:); 
%         
%     end
% end
% dem1=0;
% dem2=0;
% [c2,d2]=size(fold44);
% for i=1:c2
%     if i<0.1*c2
%         if i<0.1*0.7*c2
%             RTrain4(i,:)=fold44(i,:); 
%         else
%             dem1=dem1+1;
%             RVal4(dem1,:)=fold44(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest4(dem2,:)=fold44(i,:);
%     end
% end
% RTrain=[RTrain2;RTrain4];
% RVal=[RVal2;RVal4];
% RTest=[RTest2;RTest4];
% [X2 A B cluster center_vector] = Rule2(RTrain,X1);
% X1=X2;
% [AccuracyRVal4 Time4] = TestGraph2(RVal,A,B,X1,cluster,center_vector)
% [AccuracyRTest4 Time4] = TestGraph2(RTest,A,B,X1,cluster,center_vector)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fold25=[fold25;fold26];
[c1,d1]=size(fold25);
dem1=0;
dem2=0;
for i=1:c1
    if i<0.05*c1
        if i<0.05*0.7*c1
            RTrain2(i,:)=fold25(i,:); 
        else
            dem1=dem1+1;
            RVal2(dem1,:)=fold25(i,:);
        end
    else
        dem2=dem2+1;
        RTest2(dem2,:)=fold25(i,:); 
        
    end
end
dem1=0;
dem2=0;
fold45=[fold45;fold46];
[c2,d2]=size(fold45);
for i=1:c2
    if i<0.05*c2
        if i<0.05*0.7*c2
            RTrain4(i,:)=fold45(i,:); 
        else
            dem1=dem1+1;
            RVal4(dem1,:)=fold45(i,:);
        end
    else
        dem2=dem2+1;
        RTest4(dem2,:)=fold45(i,:);
    end
end
RTrain=[RTrain2;RTrain4];
RVal=[RVal2;RVal4];
RTest=[RTest2;RTest4];
[X2 A B cluster center_vector] = Rule2(RTrain,X1);
X1=X2;
[AccuracyRVal5 Time5] = TestGraph2(RVal,A,B,X1,cluster,center_vector)
[AccuracyRTest5 Time5] = TestGraph2(RTest,A,B,X1,cluster,center_vector)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [c1,d1]=size(fold26);
% dem1=0;
% dem2=0;
% for i=1:c1
%     if i<0.1*c1
%         if i<0.1*0.7*c1
%             RTrain2(i,:)=fold26(i,:); 
%         else
%             dem1=dem1+1;
%             RVal2(dem1,:)=fold26(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest2(dem2,:)=fold26(i,:); 
%         
%     end
% end
% dem1=0;
% dem2=0;
% [c2,d2]=size(fold46);
% for i=1:c2
%     if i<0.1*c2
%         if i<0.1*0.7*c2
%             RTrain4(i,:)=fold46(i,:); 
%         else
%             dem1=dem1+1;
%             RVal4(dem1,:)=fold46(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest4(dem2,:)=fold46(i,:);
%     end
% end
% RTrain=[RTrain2;RTrain4];
% RVal=[RVal2;RVal4];
% RTest=[RTest2;RTest4];
% [X2 A B cluster center_vector] = Rule2(RTrain,X1);
% X1=X2;
% [AccuracyRVal6 Time6] = TestGraph2(RVal,A,B,X2,cluster,center_vector)
% [AccuracyRTest6 Time6] = TestGraph2(RTest,A,B,X2,cluster,center_vector)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fold27=[fold27;fold28];
[c1,d1]=size(fold27);
dem1=0;
dem2=0;
for i=1:c1
    if i<0.05*c1
        if i<0.05*0.7*c1
            RTrain2(i,:)=fold27(i,:); 
        else
            dem1=dem1+1;
            RVal2(dem1,:)=fold27(i,:);
        end
    else
        dem2=dem2+1;
        RTest2(dem2,:)=fold27(i,:); 
        
    end
end
dem1=0;
dem2=0;
fold47=[fold47;fold48];
[c2,d2]=size(fold47);
for i=1:c2
    if i<0.05*c2
        if i<0.05*0.7*c2
            RTrain4(i,:)=fold47(i,:); 
        else
            dem1=dem1+1;
            RVal4(dem1,:)=fold47(i,:);
        end
    else
        dem2=dem2+1;
        RTest4(dem2,:)=fold47(i,:);
    end
end
RTrain=[RTrain2;RTrain4];
RVal=[RVal2;RVal4];
RTest=[RTest2;RTest4];
[X2 A B cluster center_vector] = Rule2(RTrain,X1);
X1=X2;
[AccuracyRVal7 Time7] = TestGraph2(RVal,A,B,X1,cluster,center_vector)
[AccuracyRTest7 Time7] = TestGraph2(RTest,A,B,X1,cluster,center_vector)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [c1,d1]=size(fold28);
% dem1=0;
% dem2=0;
% for i=1:c1
%     if i<0.1*c1
%         if i<0.1*0.7*c1
%             RTrain2(i,:)=fold28(i,:); 
%         else
%             dem1=dem1+1;
%             RVal2(dem1,:)=fold28(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest2(dem2,:)=fold28(i,:); 
%         
%     end
% end
% dem1=0;
% dem2=0;
% [c2,d2]=size(fold48);
% for i=1:c2
%     if i<0.1*c2
%         if i<0.1*0.7*c2
%             RTrain4(i,:)=fold48(i,:); 
%         else
%             dem1=dem1+1;
%             RVal4(dem1,:)=fold48(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest4(dem2,:)=fold48(i,:);
%     end
% end
% RTrain=[RTrain2;RTrain4];
% RVal=[RVal2;RVal4];
% RTest=[RTest2;RTest4];
% [X2 A B cluster center_vector] = Rule2(RTrain,X1);
% X1=X2;
% [AccuracyRVal8 Time8] = TestGraph2(RVal,A,B,X1,cluster,center_vector)
% [AccuracyRTest8 Time8] = TestGraph2(RTest,A,B,X1,cluster,center_vector)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fold29=[fold29;fold210];
[c1,d1]=size(fold29);
dem1=0;
dem2=0;
for i=1:c1
    if i<0.05*c1
        if i<0.05*0.7*c1
            RTrain2(i,:)=fold29(i,:); 
        else
            dem1=dem1+1;
            RVal2(dem1,:)=fold29(i,:);
        end
    else
        dem2=dem2+1;
        RTest2(dem2,:)=fold29(i,:); 
        
    end
end
dem1=0;
dem2=0;
fold49=[fold49;fold410];
[c2,d2]=size(fold49);
for i=1:c2
    if i<0.05*c2
        if i<0.05*0.7*c2
            RTrain4(i,:)=fold49(i,:); 
        else
            dem1=dem1+1;
            RVal4(dem1,:)=fold49(i,:);
        end
    else
        dem2=dem2+1;
        RTest4(dem2,:)=fold49(i,:);
    end
end
RTrain=[RTrain2;RTrain4];
RVal=[RVal2;RVal4];
RTest=[RTest2;RTest4];
[X2 A B cluster center_vector] = Rule2(RTrain,X1);
X1=X2;
[AccuracyRVal9 Time9] = TestGraph2(RVal,A,B,X1,cluster,center_vector)
[AccuracyRTest9 Time9] = TestGraph2(RTest,A,B,X1,cluster,center_vector)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [c1,d1]=size(fold210);
% dem1=0;
% dem2=0;
% for i=1:c1
%     if i<0.1*c1
%         if i<0.1*0.7*c1
%             RTrain2(i,:)=fold210(i,:); 
%         else
%             dem1=dem1+1;
%             RVal2(dem1,:)=fold210(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest2(dem2,:)=fold210(i,:); 
%         
%     end
% end
% dem1=0;
% dem2=0;
% [c2,d2]=size(fold410);
% for i=1:c2
%     if i<0.1*c2
%         if i<0.1*0.7*c2
%             RTrain4(i,:)=fold410(i,:); 
%         else
%             dem1=dem1+1;
%             RVal4(dem1,:)=fold410(i,:);
%         end
%     else
%         dem2=dem2+1;
%         RTest4(dem2,:)=fold410(i,:);
%     end
% end
% RTrain=[RTrain2;RTrain4];
% RVal=[RVal2;RVal4];
% RTest=[RTest2;RTest4];
% [X2 A B cluster center_vector] = Rule2(RTrain,X1);
% X1=X2;
% [AccuracyRVal10 Time10] = TestGraph2(RVal,A,B,X1,cluster,center_vector)
% [AccuracyRTest10 Time10] = TestGraph2(RTest,A,B,X1,cluster,center_vector)
% % 
% % output_file = strrep('Database_Breast_output','.txt','_output');
% % addpath('..\output')
% % save(['..\output\' output_file], 'Time');
% % save(['..\output\' output_file], 'Accuracy', '-append');
% % save(['..\output\' output_file], 'Recall', '-append');
% % save(['..\output\' output_file], 'Precision', '-append');
% 

