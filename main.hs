import System.Environment
import Data.List
import System.Exit
import Text.Read

valid_number number
              | number == Nothing = 1
              | otherwise = 0

check_opt args ind = do
                     let opt = ["--lines", "--start", "--move", "--window"]
                     if (elem (args !! (ind - 2)) opt == False)
                     then do putStrLn "Invalid argument"
                             exitWith $ ExitFailure 84
                     else do
                          let number = readMaybe (args !! (ind - 1)) :: Maybe Int
                          let v = valid_number number
                          if (v == 1)
                          then exitWith $ ExitFailure 84
                          else do
                               putStrLn "                                        *                                       \n                                       ***                                      \n                                      **  *                                     \n                                     ** ****                                    \n                                    **  *   *                                   \n                                   ** **** ***                                  \n                                  **  *    *  *                                 \n                                 ** ****  ******                                \n                                **  *   ***     *                               \n                               ** **** **  *   ***                              \n                              **  *    * **** **  *                             \n                             ** ****  ** *    * ****                            \n                            **  *   ***  **  ** *   *                           \n                           ** **** **  *** ***  ** ***                          \n                          **  *    * ***   *  ***  *  *                         \n                         ** ****  ** *  * *****  *******                        \n                        **  *   ***  **** *    ***      *                       \n                       ** **** **  ***    **  **  *    ***                      \n                      **  *    * ***  *  ** *** ****  **  *                     \n                     ** ****  ** *  ******  *   *   *** ****                    "
                               return ()

check_args args = do
                  if (args !! 1 /= "30" && args !! 1 /= "90" && args !! 1 /= "110")
                  then do putStrLn "Invalid rule"
                          exitWith $ ExitFailure 84
                  else do
                       let ln = length args
                       case ln of
                            2      ->   return ()
                            4      ->   do check_opt args ln
                            6      ->   do check_opt args (ln - 2)
                                           check_opt args ln
                            8      ->   do check_opt args (ln - 4)
                                           check_opt args (ln - 2)
                                           check_opt args ln
                            10     ->   do check_opt args (ln - 6)
                                           check_opt args (ln - 4)
                                           check_opt args (ln - 2)
                                           check_opt args ln
                            otherwise ->   exitWith $ ExitFailure 84

main :: IO()
main = do
    args <- getArgs
    let usage = "Your program must have more than one argument!"
    progName <- getProgName
    case args of
         [] -> do putStrLn usage
                  exitWith $ ExitFailure 84
         _ -> do
                if (length args `mod` 2 /= 0)
                   then do putStrLn "Wrong number of arguments!"
                           exitWith $ ExitFailure 84
                else if ((args !! 0) /= "--rule")
                   then do putStrLn "Rule is mandatory!"
                           exitWith $ ExitFailure 84
                else do check_args args
