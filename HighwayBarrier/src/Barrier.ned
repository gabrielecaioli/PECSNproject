//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package highwaybarrier;

module Barrier
{
    parameters:
        int N;
        int K;
        
    gates:
        input in;
       	
    submodules:
        switch: Switch;
        etcLane[K]: ETCLane;
        stdLane[N-K]: StandardLane;
        
    connections:
        in --> switch.in;
        
        for i=0..(K-1){
            switch.out_etc++ --> etcLane[i].in;
        }
        
        for i=0..(N-K-1){
            switch.out_std++ --> stdLane[i].in;
        }
}
