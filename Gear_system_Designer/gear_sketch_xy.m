%% gear_sketch
function out = gear_sketch_xy(T,M,offset_angle,ad,cx,cy)
    for i = 0:T-1
        [x,y] = line_1_xy(M,T,offset_angle,i); plot(x+cx,y+cy,'g');
        [x,y] = line_2_xy(M,T,offset_angle,i); plot(x+cx,y+cy,'g');
        [x,y] = involute_1_xy(M,T,offset_angle,i); plot(x+cx,y+cy,'b');
        [x,y] = involute_2_xy(M,T,offset_angle,i); plot(x+cx,y+cy,'b');
        [x,y] = topland_xy(M,T,offset_angle,i); plot(x+cx,y+cy,'r');
        [x,y] = bottomland_xy(M,T,offset_angle,i); plot(x+cx,y+cy,'r');
    end
    [x,y] = hole_xy(ad/2); plot(x+cx,y+cy,'w');
end