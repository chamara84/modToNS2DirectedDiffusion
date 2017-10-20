# ===================================================================

# AWK Script for calculating: 

#     => Average and std deviation of Energy.

# ===================================================================

 

BEGIN {
time_intervals = 500;
start_time = 1;

}

{
if($1=="N"){
start_time=int($3);
for (i=start_time; i<=time_intervals; i++) {

		
#		is the user known?
			if ($3>(i-1) && $3<=i) {
				sigma_energy[i][$5] = sigma_energy[i][$5] + $7;
				count[i][$5]++;
				sigma_sqr_energy[i][$5] = sigma_sqr_energy[i][$5]+($7)*($7);
				
				break;
				

			}
		}

}

}

 
END {        
  for (j=0;j<100;j++){
    for(i=1; i<=time_intervals; i++) {

          if(count[i][j] > 0) {

              averageEnergy[i][j] = sigma_energy[i][j]/count[i][j];
	      varianceEnergy[i][j] = ((sigma_sqr_energy[i][j])/count[i][j] - averageEnergy[i][j]*averageEnergy[i][j]);	

             print  j,"," i "," , averageEnergy[i][j] ;
	     #print "Standard Deviation =  " j, i , sqrt(varianceEnergy[i][j]) "joule";
       

        }

           

    }
}

    

   
 } 

