function cpic = MakeClassifierPic(all_ftypes,chosen_f,alphas,ps,W,H)

cpic = zeros(H,W);

for i=1:size(chosen_f,2)
    cpic = cpic + MakeFeaturePic(all_ftypes(chosen_f(i),:),W,H)*alphas(1,i)*ps(1,i);
end

end

